# frozen_string_literal: true

require_relative 'lib/doc_builder_testing'

task default: %w[desktop]

desc 'run parallel_rspec on builder in desktop'
task :desktop do
  ENV['BUILDER_PLATFORM'] = 'DESKTOP'
  sh 'bundle exec parallel_rspec spec'
end

desc 'run parallel_rspec on builder in documentserver'
task :web do
  ENV['BUILDER_PLATFORM'] = 'WEB'
  sh 'bundle exec parallel_rspec --exclude-pattern "spec/python_wrapper/**" spec'
end

desc 'run only critical tests'
task :rspec_critical do
  sh("parallel_rspec spec -o '--tag critical'")
end

desc 'run rspec via windows'
task :win do
  system('rspec --tag win')
end

desc 'run project spec'
task :project_spec do
  system('bundle exec parallel_rspec project_spec')
end

desc 'run tests in modified specs'
task :in_modified_specs do
  # get changes in framework
  lib_diff = `git diff --name-only origin/master -- lib dockerfiles Dockerfile Gemfile Gemfile.lock`
  if lib_diff.empty?
    # get changes in scripts and find them in spec
    scripts_diff = `git diff --name-only origin/master -- js python | xargs -I {} grep -Rl {} spec`
    # get changes in spec
    spec_diff = `git diff --name-only origin/master -- spec ':!spec/spec_helper.rb' ':!spec/test_data.rb'`
    files = spec_diff.split | scripts_diff.split
    if files.all? { |element| element =~ %r{^spec/.*\.rb} }
      files.empty? ? print('NO TESTS TO RUN.') : sh("bundle exec parallel_rspec #{files.join(' ')}")
    else
      print("An incorrect file type for rspec has been detected: #{files}")
      Rake::Task['default'].invoke
    end
  else
    Rake::Task['default'].invoke
  end
end

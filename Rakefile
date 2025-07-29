# frozen_string_literal: true

require_relative 'lib/doc_builder_testing'

task default: %w[desktop]

desc 'run parallel_rspec on builder in desktop'
task :desktop do
  ENV['BUILDER_PLATFORM'] = 'DESKTOP'
  server = DocBuilderWrapper.new
  puts "Run on version #{server.version}"
  sh 'bundle exec parallel_rspec spec'
end

desc 'run parallel_rspec on builder in documentserver'
task :web do
  ENV['BUILDER_PLATFORM'] = 'WEB'
  server = WebDocBuilderWrapper.new(documentserver_path: 'https://doc-linux.teamlab.info')
  # server = WebDocBuilderWrapper.new(documentserver_path: 'https://kim.teamlab.info')
  ENV['WEB_BUILDER_URL'] = server.uri
  puts "Run on #{server.uri}, version #{server.version_with_build}"
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
  run_default = false

  # get changes in framework
  lib_diff = `git diff --name-only origin/master -- lib dockerfiles Dockerfile Gemfile Gemfile.lock 2>&1`
  # check of comparison results/errors
  run_default = true if !lib_diff.empty? || lib_diff.include?('fatal:')

  # get changes in scripts and find them in spec
  scripts_diff = `git diff --name-only origin/master -- js python | xargs -I {} grep -Rl {} spec`
  # get changes in spec
  spec_diff = `git diff --name-only origin/master -- spec ':!spec/spec_helper.rb' ':!spec/test_data.rb'`
  files = spec_diff.split | scripts_diff.split

  unless run_default
    if files.all? { |element| element =~ %r{^spec/.*\.rb} }
      files.empty? ? print('NO TESTS TO RUN.') : sh("bundle exec parallel_rspec #{files.join(' ')}")
    else
      print("An incorrect file type for rspec has been detected: #{files}")
      run_default = true
    end
  end

  Rake::Task['default'].invoke if run_default
end

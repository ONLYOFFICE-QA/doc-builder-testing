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
  modified_files = `git diff --name-only origin/master -- spec`
  files = modified_files.split
  files -= %w[spec/spec_helper.rb spec/test_data.rb]
  if files.all? { |element| element =~ %r{^spec/.*\.rb} }
    files.empty? ? print('No tests to run') : sh("bundle exec parallel_rspec #{files.join(' ')}")
  end
end

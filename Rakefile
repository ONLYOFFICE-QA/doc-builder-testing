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
  sh 'bundle exec parallel_rspec spec'
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

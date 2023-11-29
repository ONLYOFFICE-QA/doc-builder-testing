# frozen_string_literal: true

require_relative 'lib/doc_builder_testing'

task default: %w[run_tests_on_desktop]

desc 'run parallel_rspec on builder in desktop'
task :run_tests_on_desktop do
  ENV['BUILDER_PLATFORM'] = 'DESKTOP'
  sh 'bundle exec parallel_rspec spec'
end

desc 'run parallel_rspec on builder in documentserver'
task :run_tests_on_web do
  ENV['BUILDER_PLATFORM'] = 'WEB'
  sh 'bundle exec parallel_rspec spec'
end

desc 'run only critical tests'
task :rspec_critical do
  sh("parallel_rspec spec -o '--tag critical'")
end

desc 'run rspec via windows'
task :run_test_on_win do
  system('rspec --tag win')
end

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

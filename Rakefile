desc 'run parallel_rspec on builder in documentserver'
task :web do
  ENV['BUILDER_PLATFORM'] = 'WEB'
  sh 'bundle exec parallel_rspec spec'
end

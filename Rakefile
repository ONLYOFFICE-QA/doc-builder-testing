# frozen_string_literal: true

require 'csv'
require_relative 'lib/doc_builder_testing'
require_relative 'lib/coverage/test_coverage_result'

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

desc 'Generate report with resource usage'
task :resource_usage_report do
  results = []
  files = Dir["#{Dir.pwd}/js/**/*.js"]
  files.each do |file|
    data = DocBuilderWrapper.new.build_file_with_usage_stats(file)
    results << { file: file, memory: data.memory, time: data.user_time }
  end
  memory_sum = results.sum { |h| h[:memory] }
  time_sum = results.sum { |h| h[:time] }
  CSV.open('report.csv', 'w') do |csv|
    csv << %w[File Memory Time]
    results.each do |data_line|
      csv << [data_line[:file], data_line[:memory], data_line[:time]]
    end
    csv << ['Total:', memory_sum, time_sum]
  end
end

desc 'run rspec via windows'
task :run_test_on_win do
  system('rspec --tag win')
end

desc 'run coverage'
task :coverage do
  File.binwrite(File.join(Dir.pwd, 'reports', 'coverage_result.json').to_s,
                TestCoverageResult.new.run)
end

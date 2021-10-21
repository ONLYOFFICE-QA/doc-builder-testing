# frozen_string_literal: true

require 'csv'
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

desc 'Generate report with memory usage'
task :memory_usage_report do
  data = []
  files = Dir["#{Dir.pwd}/asserts/js/**/*.js"]
  files.each do |file|
    memory = DocBuilderWrapper.new.build_file_memory_usage(file)
    data << { file: file, memory: memory }
  end
  memory_sum = data.sum { |h| h[:memory] }
  CSV.open('report.csv', 'w') do |csv|
    csv << %w[File Memory]
    data.each do |data_line|
      csv << [data_line[:file], data_line[:memory]]
    end
    csv << ['Total memory:', memory_sum]
  end
end

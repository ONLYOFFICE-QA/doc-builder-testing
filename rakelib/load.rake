# frozen_string_literal: true

require 'rspec/core/rake_task'

namespace(:load) do
  desc 'Generate report with resource usage'
  task :resource_usage do
    results = []
    files = Dir["#{Dir.pwd}/js/**/*.js"]
    files.each do |file|
      data = DocBuilderWrapper.new.build_file_with_usage_stats(file)
      results << { file: file, memory: data.memory, time: data.user_time }
    end
    memory_sum = results.sum { |h| h[:memory] }
    time_sum = results.sum { |h| h[:time] }
    CSV.open("#{Dir.pwd}/reports/load.csv", 'w') do |csv|
      csv << %w[File Memory Time]
      results.each do |data_line|
        csv << [data_line[:file], data_line[:memory], data_line[:time]]
      end
      csv << ['Total:', memory_sum, time_sum]
    end
  end
end

# frozen_string_literal: true

require 'rspec/core/rake_task'
require_relative '../lib/coverage/test_coverage_result'

namespace(:coverage) do
  desc 'ApiBuilder coverage'
  task :builder do
    File.binwrite("#{Dir.pwd}/reports/coverage_result.json",
                  TestCoverageResult.new.generate)
  end
end

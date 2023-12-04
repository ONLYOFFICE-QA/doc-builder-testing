# frozen_string_literal: true

require 'json'
require 'net/http'
require_relative 'method_matcher'
require_relative 'coverage_static_data'

# Represents a class each instance of which is ready to calculate test coverage
# in a project for API Builder methods
class TestCoverageResult
  include CoverageStaticData

  attr_reader :api_list

  def initialize(address: ADDRESS)
    @api_list = download_at(address)
  end

  # @param [String] url
  # @return [String, JSON] Returns the full entity body.
  def download_at(url)
    file_url = URI.parse(url)
    http = Net::HTTP.new(file_url.host.to_s, file_url.port)
    http.use_ssl = (file_url.scheme = 'https')
    response = http.get(file_url.path.to_s)
    raise "Failed to download the file. HTTP status code: #{response.code}" unless response.code.to_i == 200

    response.body
  end

  # @param [String] method_list
  # @return [String] edited JSON
  def generate
    method_list = JSON.parse(@api_list)
    EDITORS.each do |key, type|
      method_list[type].each_value do |method|
        method.reject! do |element|
          MethodMatcher.new(element, SOURCES[key]).pattern_found?
        end
      end
    end
    JSON.pretty_generate(method_list)
  end
end

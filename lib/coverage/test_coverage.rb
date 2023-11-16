# frozen_string_literal: true

require 'net/http'
require 'json'

# toplevel documentation
module TestCoverage
  ADDRESS = 'https://raw.githubusercontent.com/ONLYOFFICE-QA/testing-api.onlyoffice.com/master/templates/document_builder/usage_api.json'

  REDACTORS = {
    'CDE' => 'Text document API',
    'CSE' => 'Spreadsheet API',
    'CPE' => 'Presentation API'
  }.freeze

  SOURCES = {
    'CDE' => File.join(Dir.pwd, 'js', 'docx', 'smoke').to_s,
    'CSE' => File.join(Dir.pwd, 'js', 'xlsx', 'smoke').to_s,
    'CPE' => File.join(Dir.pwd, 'js', 'pptx', 'smoke').to_s
  }.freeze

  # MethodCoverage class
  class Matcher
    def initialize(pattern, path)
      @flag = false
      @pattern = pattern
      @path = path
      recursive_search
    end

    def pattern_found?
      @flag
    end

    private

    def recursive_search(pattern = @pattern, node = @path)
      if File.file?(node)
        contains_matches?(node, pattern)
        return @flag
      end

      dir_instance = Dir.new(node)
      dir_instance.each_child do |child|
        recursive_search(pattern, File.join(dir_instance.path.to_s, child))
      end
    end

    def contains_matches?(path, pattern)
      File.open(path, 'r') do |file|
        file.each_line do |line|
          next unless line.include?("#{pattern}(")

          @flag = true # Switch global flag
          break
        end
      end
    end
  end

  def self.get_api(url)
    file_url = URI.parse(url)
    http = Net::HTTP.new(file_url.host.to_s, file_url.port)
    http.use_ssl = (file_url.scheme = 'https')
    response = http.get(file_url.path.to_s)
    if response.code.to_i == 200
      response.body
    else
      puts "Failed to download the file. HTTP status code: #{response.code}"
    end
  end

  def self.run(method_list = get_api(ADDRESS))
    method_list = JSON.parse(method_list)
    REDACTORS.each do |key, type|
      method_list[type].each do |_api_class, method|
        method.reject! { |element| Matcher.new(element, SOURCES[key]).pattern_found? }
      end
    end
    JSON.pretty_generate(method_list)
  end
end

# p TestCoverage::Matcher.new('SetData', 'js').pattern_found?

File.binwrite(File.join(Dir.pwd, 'reports', 'coverage_result.json').to_s,
              TestCoverage.run)

# frozen_string_literal: true

require 'net/http'
require 'json'

# Represents a container for test coverage calculation methods
module TestCoverage
  # List of methods that are parse from api.onlyoffice.com
  ADDRESS = 'https://raw.githubusercontent.com/ONLYOFFICE-QA/testing-api.onlyoffice.com/master/templates/document_builder/usage_api.json'

  # Representation of editors in different sources
  REDACTORS = {
    'CDE' => 'Text document API',
    'CSE' => 'Spreadsheet API',
    'CPE' => 'Presentation API',
    'Form' => 'Form API'
  }.freeze

  # Pathways in the project
  SOURCES = {
    'CDE' => File.join(Dir.pwd, 'js', 'docx', 'smoke').to_s,
    'CSE' => File.join(Dir.pwd, 'js', 'xlsx', 'smoke').to_s,
    'CPE' => File.join(Dir.pwd, 'js', 'pptx', 'smoke').to_s,
    'Form' => File.join(Dir.pwd, 'js', 'form', 'smoke').to_s
  }.freeze

  # @return [String (frozen)]
  def self.address
    ADDRESS
  end

  # @return [String (frozen)}]
  def self.redactors
    REDACTORS
  end

  # Represents a class describing the logic of recursive file system traversal
  class Matcher
    def initialize(pattern, path)
      @flag = false
      @pattern = pattern
      @path = path
      recursive_search
    end

    # @return [TrueClass, FalseClass]
    def pattern_found?
      @flag
    end

    private

    # @param [Object] pattern
    # @param [Object] node
    # @return [Dir, TrueClass, FalseClass]
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

    # @param [Object] path
    # @param [Object] pattern
    # @return [Object]
    def contains_matches?(path, pattern)
      File.open(path, 'r') do |file|
        file.each_line do |line|
          # regex pattern for js method
          next unless line.match?(/#{pattern}\(.*\)/)

          @flag = true # Switch global flag
          break
        end
      end
    end
  end

  # @param [String] url (default: ADDRESS env )
  # @return [String] body JSON
  def self.get_api(url: ADDRESS)
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

  # @param [String] method_list
  # @return [String] JSON
  def self.run(method_list)
    method_list = JSON.parse(method_list)
    REDACTORS.each do |key, type|
      method_list[type].each do |_api_class, method|
        method.reject! { |element| Matcher.new(element, SOURCES[key]).pattern_found? }
      end
    end
    JSON.pretty_generate(method_list)
  end
end

# frozen_string_literal: true

# Class for Wrapping doc building from server side
require 'json'
require 'jwt'
require 'net/http'
require_relative 'doc_builder_helper'
require_relative 'doc_builder_wrapper/doc_builder_version_helper'

# Class for working with documentbuilder
class WebDocBuilderWrapper
  include DocBuilderHelper
  include DocBuilderVersionHelper

  def initialize(documentserver_path = 'https://doc-linux.teamlab.info')
    @uri = URI(documentserver_path)
    @http = Net::HTTP.new(@uri.host, @uri.port)
    @http.use_ssl = true if @uri.port == 443
    @request_data = Net::HTTP::Post.new('/docbuilder?async=false')
    @temp_script_data = nil
    @jwt_key = 'doc-linux'
    @jwt_header = 'AuthorizationJwt'
    @jwt_prefix = 'Bearer'
  end

  # Send script for building and parse it
  # @param script_file [String] path to script file
  # @return [OoxmlParser::CommonDocumentStructure] parsed file if file is Ooxml
  # @return [OnlyofficePdfParser::PdfStructure] parsed structure if file is PDF
  def build_and_parse(script_file)
    output_file = build_file(script_file)
    parse(output_file)
  end

  # @return [String] command of version
  def version
    starting_lines = `curl --compressed -m 10 --insecure -r 0-300 #{@uri}/sdkjs/word/sdk-all.js 2>/dev/null`
    trimmed_lines = starting_lines[0..300]
    trimmed_lines[/\d(\.)\d(\.)\d/]
  end

  # Build file from script file
  # @param script_file [String] path to file with script
  # @return [String] path to build file
  def build_file(script_file)
    temp_script_data = change_output_file(script_file)
    @temp_script_data = temp_script_data
    link_to_file = build(temp_script_data[:temp_script_file].path)
    download_file(link_to_file, temp_script_data[:output_file])
    temp_script_data[:output_file]
  end

  # @return [String] link to file after building
  def build(script_file)
    @request_data.body = read_script_file(script_file)
    add_jwt_data(@request_data)
    response = @http.request(@request_data)
    check_response_for_errors(response)
    JSON.parse(response.body)['urls'].values.first
  end

  # Add jwt data to request
  # @param request [Net::HTTP::Post] to add
  # @return [Net::HTTP::Post] with added jwt
  def add_jwt_data(request)
    payload_to_encode = { 'payload' => '{}' }
    jwt_encoded = JWT.encode payload_to_encode, @jwt_key
    request[@jwt_header] = "#{@jwt_prefix} #{jwt_encoded}"
  end

  # Read script from file
  # @param script [String] file to read
  # @return [String] result of read
  def read_script_file(script)
    raise WebDocBuilderError, 'Filepath is incorrect' unless File.exist?(script)

    File.open(script, 'r').read
  end

  # Download file to path
  # @param url [String] url to downlad
  # @param output_file [String] path to store file
  # @return [nil]
  def download_file(url, output_file)
    `wget -qO '#{output_file}' '#{url}'`
  end

  private

  # Raise errors if response somehow wrong
  # @param response [Net::HTTPResponse] response to check error
  # @return [nil]
  def check_response_for_errors(response)
    raise WebDocBuilderError, response unless response.code == '200'
    raise EmptyUrlsInWebBuilderResponse, response if JSON.parse(response.body)['urls'].empty?
  end
end

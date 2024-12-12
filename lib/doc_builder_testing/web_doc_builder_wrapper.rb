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

  def initialize(**args)
    @uri = URI(args.fetch(:documentserver_path, default_web_builder_url))
    @http = Net::HTTP.new(@uri.host, @uri.port)
    @http.use_ssl = true if @uri.port == 443
    @request_data = Net::HTTP::Post.new('/docbuilder?async=false')
    @temp_script_data = nil
    @jwt_key = args.fetch(:jwt_key, 'doc-linux')
    @jwt_header = args.fetch(:jwt_header, 'AuthorizationJwt')
    @jwt_prefix = 'Bearer'
    @payload_params = { payload: {} }
  end

  # @return [String] Url of DocBuilder
  def builder_url
    @uri
  end

  # @return [String] Url for default location of DocBuilder
  def default_web_builder_url
    ENV.fetch('WEB_BUILDER_URL', 'https://doc-linux.teamlab.info')
  end

  # Send script for building and parse it
  # @param script_file [String] path to script file
  # @param kwargs [Hash] build arguments passed to script in key=value format
  # @return [OoxmlParser::CommonDocumentStructure] parsed file if file is Ooxml
  # @return [OnlyofficePdfParser::PdfStructure] parsed structure if file is PDF
  def build_and_parse(script_file, **kwargs)
    output_file = build_file(script_file, **kwargs)
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
  # @param kwargs [Hash] build arguments passed to script in key=value format
  # @return [String] path to build file
  def build_file(script_file, **kwargs)
    temp_script_data = change_output_file(script_file)
    @temp_script_data = temp_script_data
    link_to_file = build(temp_script_data[:temp_script_file].path, **kwargs)
    download_file(link_to_file, temp_script_data[:output_file])
    temp_script_data[:output_file]
  end

  # @param kwargs [Hash] build arguments passed to script in key=value format
  # @return [String] link to file after building
  def build(script_file, **kwargs)
    add_payload_params(argument: kwargs) if kwargs != {}
    @request_data.body = read_script_file(script_file)
    add_jwt_data(@request_data)
    response = @http.request(@request_data)
    check_response_for_errors(response)
    JSON.parse(response.body)['urls'].values.first
  end

  # Add payload params to @payload_params
  # @param kwargs [Hash] parameters to add
  # @return [nil]
  def add_payload_params(**kwargs)
    kwargs.each do |key, value|
      @payload_params[:payload][key] = value
    end
  end

  # Add jwt data to request
  # @param request [Net::HTTP::Post] to add
  # @return [Net::HTTP::Post] with added jwt
  def add_jwt_data(request)
    jwt_encoded = JWT.encode @payload_params, @jwt_key
    request[@jwt_header] = "#{@jwt_prefix} #{jwt_encoded}"
  end

  # Read script from file
  # @param script [String] file to read
  # @return [String] result of read
  def read_script_file(script)
    raise WebDocBuilderError, 'Filepath is incorrect' unless File.exist?(script)

    File.read(script)
  end

  # Download file to path
  # @param url [String] url to downlad
  # @param output_file [String] path to store file
  # @return [nil]
  def download_file(url, output_file)
    `wget -qO '#{output_file}' '#{url}'`
  end

  private

  # Possible error codes and their description for /command
  # @return [Hash]
  def command_codes
    {
      0 => 'No errors.',
      1 => 'Document key is missing or no document with such key could be found.',
      2 => 'Callback url not correct.',
      3 => 'Internal server error.',
      4 => 'No changes were applied to the document before the forcesave command was received.',
      5 => 'Command not correct.',
      6 => 'Invalid token.'
    }
  end

  # Raise errors if response somehow wrong
  # @param response [Net::HTTPResponse] response to check error
  # @return [nil]
  def check_response_for_errors(response)
    webbuilder_errors = { '-1': 'Unknown error.',
                          '-2':	'Generation timeout error.',
                          '-3':	'Document generation error.',
                          '-4':	'Error while downloading the document file to be generated.',
                          '-6':	'Error while accessing the document generation result database.',
                          '-8':	'Invalid token.' }
    raise WebDocBuilderError, response unless response.code == '200'

    webbuilder_errors.each do |key, value|
      raise WebDocBuilderError, value if response.body.include?("\"error\":#{key}")
    end
    raise EmptyUrlsInWebBuilderResponse, response if JSON.parse(response.body)['urls'].empty?
  end
end

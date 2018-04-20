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
  # @return [OoxmlParser::CommonDocumentStructure] parsed file
  def build_doc_and_parse(script_file)
    temp_script_data = change_output_file(script_file)
    @temp_script_data = temp_script_data
    link_to_file = build_doc(temp_script_data[:temp_script_file].path)
    download_file(link_to_file, temp_script_data[:output_file])
    parse(temp_script_data[:output_file])
  end

  # @return [String] command of version
  def version
    starting_lines = `curl --compressed -m 10 --insecure -r 0-300 #{@uri}/sdkjs/word/sdk-all.js 2>/dev/null`
    trimmed_lines = starting_lines[0..300]
    trimmed_lines[/\d(\.)\d(\.)\d/]
  end

  def build_doc_without_parse(script_file)
    temp_script_data = change_output_file(script_file)
    @temp_script_data = temp_script_data
    link_to_file = build_doc(temp_script_data[:temp_script_file].path)
    download_file(link_to_file, temp_script_data[:output_file])
    temp_script_data[:output_file]
  end

  # @return [String] link to file after building
  def build_doc(script_file)
    @request_data.body = read_script_file(script_file)
    add_jwt_data(@request_data)
    responce = @http.request(@request_data)
    raise DocBuilderError, responce unless responce.code == '200'
    JSON.parse(responce.body)['urls'].values.first
  end

  def add_jwt_data(request)
    payload_to_encode = { 'payload' => '{}' }
    jwt_encoded = JWT.encode payload_to_encode, @jwt_key
    request[@jwt_header] = "#{@jwt_prefix} #{jwt_encoded}"
  end

  def read_script_file(script)
    raise WebDocBuilderError, 'Filepath is incorrect' unless File.exist?(script)
    File.open(script, 'r').read
  end

  def download_file(url, output_file)
    `wget -qO '#{output_file}' '#{url}'`
  end
end

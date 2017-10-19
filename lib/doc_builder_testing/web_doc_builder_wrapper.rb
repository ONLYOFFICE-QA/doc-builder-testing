# Class for Wrapping doc building from server side
require 'json'
require 'net/http'
require_relative 'doc_builder_helper'

# Class for working with documentbuilder
class WebDocBuilderWrapper
  include DocBuilderHelper

  def initialize(documentserver_path = 'https://doc-linux.teamlab.info')
    uri = URI(documentserver_path)
    @https = Net::HTTP.new(uri.host, uri.port)
    @https.use_ssl = true
    @request_data = Net::HTTP::Post.new('/docbuilder')
    @temp_script_data = nil
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
    responce = @https.request(@request_data)
    raise DocBuilderError, responce unless responce.code == '200'
    JSON.parse(responce.body)['urls'].values.first
  end

  def read_script_file(script)
    raise WebDocBuilderError, 'Filepath is incorrect' unless File.exist?(script)
    File.open(script, 'r').read
  end

  def download_file(url, output_file)
    `wget -qO '#{output_file}' '#{url}'`
  end
end

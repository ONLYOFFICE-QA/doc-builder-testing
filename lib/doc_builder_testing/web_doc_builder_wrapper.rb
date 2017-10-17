# Class for Wrapping doc building from server side
require 'tempfile'
require 'ooxml_parser'
require_relative 'doc_builder_helper'
require 'net/http'
require 'json'

# Class for working with documentbuilder
class WebDocBuilderWrapper
  include DocBuilderHelper

  def initialize
    uri = URI('https://doc-linux.teamlab.info')
    @https = Net::HTTP.new(uri.host, uri.port)
    @https.use_ssl = true
    @request_data = Net::HTTP::Post.new('/docbuilder')
    @temp_script_data = nil
  end

  # Send script for building and parse it
  # @param script_file [String] path to script file
  # @return [OoxmlParser::CommonDocumentStructure] parsed file
  def build_doc_and_parse(script_file)
    temp_script_data = WebDocBuilderWrapper.change_output_file(script_file)
    @temp_script_data = temp_script_data
    link_to_file = build_doc(temp_script_data[:temp_script_file].path)
    WebDocBuilderWrapper.download_file(link_to_file, temp_script_data[:output_file])
    parse(temp_script_data[:output_file])
  end

  def build_doc_without_parse(script_file)
    temp_script_data = WebDocBuilderWrapper.change_output_file(script_file)
    @temp_script_data = temp_script_data
    link_to_file = build_doc(temp_script_data[:temp_script_file].path)
    WebDocBuilderWrapper.download_file(link_to_file, temp_script_data[:output_file])
    temp_script_data[:output_file]
  end

  # @return [String] link to file after building
  def build_doc(script_file)
    script = WebDocBuilderWrapper.read_script_file(script_file)
    @request_data.body = File.open(script_file, 'r').read
    responce = @https.request(@request_data)
    raise DocBuilderError, responce unless responce.code == '200'
    JSON.parse(responce.body)['urls'].values.first
  end

  def self.read_script_file(script)
    raise WebDocBuilderError, 'Filepath is incorrect' unless File.exist?(script)
    File.open(script, 'r').read
  end

  def self.download_file(url, output_file)
    `wget -qO '#{output_file}' '#{url}'`
  end

  # Make a copy of script file, so no need to change output path on real file
  # @param script_file [String] path to actual script file
  # @param format [Symbol, String] type of file (docx, xlsx)
  # @return [Hash] {temp_script_file: file_path, temp_output_file: output_path}
  def self.change_output_file(script_file)
    script_file_content = File.open(script_file, 'r').read
    output_format = WebDocBuilderWrapper.recognize_output_format(script_file_content)
    temp_output_file = Tempfile.new([File.basename(script_file), ".#{output_format}"])
    output_path = temp_output_file.path
    script_file_content.gsub!(/^builder\.SaveFile.*$/, "builder.SaveFile(\"#{output_format}\", \"#{output_path}\");")
    temp_output_file.close!
    temp_script_file = Tempfile.new([File.basename(script_file), File.extname(script_file)])
    temp_script_file.write(script_file_content)
    temp_script_file.close
    { temp_script_file: temp_script_file, output_file: output_path }
  end

  # Recognize format from script file
  # @param script [String] script content
  # @return [String] type of file
  def self.recognize_output_format(script)
    script.match(/builder.SaveFile\(\"(.*)\",/)[1]
  end
end

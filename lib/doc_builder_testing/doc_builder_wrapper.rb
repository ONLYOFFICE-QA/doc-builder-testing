# Class for Wrapping doc building
require 'tempfile'
require 'ooxml_parser'
require_relative 'doc_builder_helper'

# Class for working with documentbuilder
class DocBuilderWrapper
  include DocBuilderHelper

  # Path to Builder exe
  attr_accessor :builder_exe

  def initialize(builder_exe: default_builder_location)
    @builder_exe = builder_exe
  end

  # @return [String] location of builder on different OS
  def default_builder_location
    return 'C:\ONLYOFFICE\DocumentBuilder\docbuilder.exe' if Gem.win_platform?
    '/usr/bin/documentbuilder'
  end

  # @return [String] command to run builder for any platform
  def run_build_command(script_file)
    "#{@builder_exe} #{script_file} 2>&1"
  end

  def build_doc(script_file)
    build_result = `#{run_build_command(script_file)}`
    raise DocBuilderError, build_result if build_result =~ /[Ee]rror|not found/
  end

  # Build document and parse it
  # @param script_file [String] path to script file
  # @return [OoxmlParser::CommonDocumentStructure] parsed file
  def build_doc_and_parse(script_file)
    temp_script_data = DocBuilderWrapper.change_output_file(script_file)
    build_doc(temp_script_data[:temp_script_file].path)
    wait_file_creation(temp_script_data[:temp_output_file].path)
    parse(temp_script_data[:temp_output_file].path)
  end

  def build_doc_without_parse(script_file)
    temp_script_data = DocBuilderWrapper.change_output_file(script_file)
    build_doc(temp_script_data[:temp_script_file].path)
    wait_file_creation(temp_script_data[:temp_output_file].path)
    temp_script_data[:temp_output_file].path
  end

  # Make a copy of script file, so no need to change output path on real file
  # @param script_file [String] path to actual script file
  # @param format [Symbol, String] type of file (docx, xlsx)
  # @return [Hash] {temp_script_file: file_path, temp_output_file: output_path}
  def self.change_output_file(script_file)
    script_file_content = File.open(script_file, 'r').read
    output_format = DocBuilderWrapper.recognize_output_format(script_file_content)
    temp_output_file = Tempfile.new([File.basename(script_file), ".#{output_format}"])
    script_file_content.gsub!(/^builder\.SaveFile.*$/, "builder.SaveFile(\"#{output_format}\", \"#{temp_output_file.path}\");")
    temp_script_file = Tempfile.new([File.basename(script_file), File.extname(script_file)])
    temp_script_file.write(script_file_content)
    temp_script_file.close
    { temp_script_file: temp_script_file, temp_output_file: temp_output_file }
  end

  # Recognize format from script file
  # @param script [String] script content
  # @return [String] type of file
  def self.recognize_output_format(script)
    script.match(/builder.SaveFile\(\"(.*)\",/)[1]
  end
end

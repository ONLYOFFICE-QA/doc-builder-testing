# frozen_string_literal: true

# Class for Wrapping doc building
require_relative 'doc_builder_helper'

# Class for working with DocBuilder Python wrapper
class DocBuilderPythonWrapper
  include DocBuilderHelper

  def initialize
    @python = Gem.win_platform? ? 'python' : 'python3'
  end

  # @param script_file [String] script file
  # @return [String] command to run builder for any platform
  def run_build_command(script_file)
    "#{@python} #{script_file} 2>&1"
  end

  # Build file from script
  # @param script_file [String] script file
  # @return [String] output file path
  def build(script_file)
    build_result = `#{run_build_command(script_file)}`
    raise DocBuilderError, build_result if build_result.include?('Error')
  end

  # Build document and parse it
  # @param script_file [String] path to script file
  # @return [OnlyofficePdfParser::PdfStructure, OoxmlParser::Parser, nil] parsed file if file is Ooxml or structure if file is PDF
  def build_and_parse(script_file)
    temp_script_data = build_file(script_file)
    parse(temp_script_data)
  end

  # Build file from script file
  # @param script_file [String] path to file with script
  # @return [String] path to build file
  def build_file(script_file)
    temp_script_data = change_output_file(script_file)
    build(temp_script_data[:temp_script_file].path)
    wait_file_creation(temp_script_data[:output_file])
    temp_script_data[:output_file]
  end
end

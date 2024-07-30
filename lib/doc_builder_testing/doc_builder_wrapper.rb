# frozen_string_literal: true

# Class for Wrapping doc building
require_relative 'doc_builder_helper'
require_relative 'doc_builder_wrapper/doc_builder_version_helper'
require_relative 'doc_builder_wrapper/bin_time_result_parser'

# Class for working with DocBuilder
class DocBuilderWrapper
  include DocBuilderHelper
  include DocBuilderVersionHelper

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

  # @param kwargs_json [String] build arguments in json string format
  # @return [String] formatted argument
  def get_argument_string(kwargs_json)
    kwargs_json.gsub('"', '\"').sub(/^{/, '\{').sub(/}$/, '\}')
  end

  # @param script_file [String] script file
  # @param kwargs [Hash] build arguments
  # @return [String] command to run builder for any platform
  def run_build_command(script_file, **kwargs)
    argument = kwargs == {} ? nil : get_argument_string(kwargs.to_json)
    "#{@builder_exe}#{" --argument=#{argument}" if argument} #{script_file} 2>&1"
  end

  # Build file from script
  # @param script_file [String] script file
  # @return [nil]
  def build(script_file, **kwargs)
    build_result = `#{run_build_command(script_file, **kwargs)}`
    raise DocBuilderError, build_result if /[Ee]rror|not found/.match?(build_result)
  end

  # @return [String] command of version
  def version
    `#{@builder_exe} -v`
  end

  # @return [String] default path to license
  def license_path
    return 'C:/ONLYOFFICE/DocumentBuilder/license' if Gem.win_platform?

    '/opt/onlyoffice/documentbuilder/license'
  end

  # Build document and parse it
  # @param script_file [String] path to script file
  # @return [OoxmlParser::CommonDocumentStructure] parsed file if file is Ooxml
  # @return [OnlyofficePdfParser::PdfStructure] parsed structure if file is PDF
  def build_and_parse(script_file, **kwargs)
    temp_script_data = build_file(script_file, **kwargs)
    parse(temp_script_data)
  end

  # Build file from script file
  # @param script_file [String] path to file with script
  # @return [String] path to build file
  def build_file(script_file, **kwargs)
    temp_script_data = change_output_file(script_file)
    build(temp_script_data[:temp_script_file].path, **kwargs)
    wait_file_creation(temp_script_data[:output_file])
    temp_script_data[:output_file]
  end

  # Build file and return memory usage of building this file
  # @param [String] script_file file to build
  # @return [BinTimeResultParser] Process data
  def build_file_with_usage_stats(script_file, **kwargs)
    temp_script_data = change_output_file(script_file)
    output = `/usr/bin/time -v #{run_build_command(temp_script_data[:temp_script_file].path, **kwargs)}`
    BinTimeResultParser.new(output)
  end
end

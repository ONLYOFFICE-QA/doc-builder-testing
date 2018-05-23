# Class for Wrapping doc building
require_relative 'doc_builder_helper'
require_relative 'doc_builder_wrapper/doc_builder_version_helper'

# Class for working with documentbuilder
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

  # @return [String] command to run builder for any platform
  def run_build_command(script_file)
    "#{@builder_exe} #{script_file} 2>&1"
  end

  def build(script_file)
    build_result = `#{run_build_command(script_file)}`
    raise DocBuilderError, build_result if build_result =~ /[Ee]rror|not found/
  end

  # @return [String] command of version
  def version
    `#{@builder_exe} -v`
  end

  # @return [String] defualt path to license
  def license_path
    return 'C:/ONLYOFFICE/DocumentBuilder/license' if Gem.win_platform?
    '/opt/onlyoffice/documentbuilder/license'
  end

  # Build document and parse it
  # @param script_file [String] path to script file
  # @return [OoxmlParser::CommonDocumentStructure] parsed file if file is Ooxml
  # @return [OnlyofficePdfParser::PdfStructure] parsed structure if file is PDF
  def build_and_parse(script_file)
    temp_script_data = build_file(script_file)
    parse(temp_script_data)
  end

  def build_file(script_file)
    temp_script_data = change_output_file(script_file)
    build(temp_script_data[:temp_script_file].path)
    wait_file_creation(temp_script_data[:output_file])
    temp_script_data[:output_file]
  end
end

# Class for Wrapping doc building
require 'tempfile'
require 'ooxml_parser'
class DocBuilderWrapper
  # Path to Builder exe
  attr_accessor :builder_exe

  def initialize(builder_exe: '/usr/bin/documentbuilder')
    DocBuilderWrapper.update_config
    @builder_exe = builder_exe
  end

  def build_doc(script_file)
    build_result = `#{@builder_exe} #{script_file} 2>&1`
    if /[Ee]rror|not found/ === build_result
     return if /licence error/ === build_result
     raise DocBuilderError, build_result
    end
  end

  # Build document and parse it
  # @param script_file [String] path to script file
  # @return [OoxmlParser::CommonDocumentStructure] parsed file
  def build_doc_and_parse(script_file)
    temp_script_data = DocBuilderWrapper.change_output_file(script_file)
    build_doc(temp_script_data[:temp_script_file])
    OoxmlParser::Parser.parse(temp_script_data[:temp_output_file])
  end

  # Make a copy of script file, so no need to change output path on real file
  # @param script_file [String] path to actual script file
  # @param format [Symbol, String] type of file (docx, xlsx)
  # @return [Hash] {temp_script_file: file_path, temp_output_file: output_path}
  def self.change_output_file(script_file)
    script_file_content = File.open(script_file, "r").read
    format = DocBuilderWrapper.recognize_format_from_script(script_file_content)
    temp_output_file = Tempfile.new([File.basename(script_file), ".#{format}"])
    script_file_content.gsub!(/^builder\.SaveFile.*$/, "builder.SaveFile(\"#{format}\", \"#{temp_output_file.path}\");")
    temp_script_file = Tempfile.new([File.basename(script_file), File.extname(script_file)])
    temp_script_file.write(script_file_content)
    temp_script_file.close
    {temp_script_file: temp_script_file.path, temp_output_file: temp_output_file.path}
  end

  # Update DocBuilder config file for custom location of sdk_all
  # @param sdk_all_path [String] path to custom location
  # @param path_to_config [String] config file to update
  # @return [Nothing]
  def self.update_config(sdk_all_path: "#{ENV['HOME']}/jenkins/workspace/onlyoffice-documentserver-enterprise-3.8.0/sdkjs",
                         path_to_config: '/opt/onlyoffice/documentbuilder/DoctRenderer.config')
    return unless File.directory?(sdk_all_path)
    content = File.read(path_to_config)
    return if content.include?(sdk_all_path)
    content = content.gsub(/^.*sdkjs\/word\/sdk-all.js.*$/, "<file>#{sdk_all_path}/word/sdk-all.js</file>")
    content = content.gsub(/^.*sdkjs\/word\/sdk-all-min.js.*$/, "<file>#{sdk_all_path}/word/sdk-all-min.js</file>")
    content = content.gsub(/^.*sdkjs\/slide\/sdk-all.js.*$/, "<file>#{sdk_all_path}/slide/sdk-all.js</file>")
    content = content.gsub(/^.*sdkjs\/slide\/sdk-all-min.js.*$/, "<file>#{sdk_all_path}/slide/sdk-all-min.js</file>")
    content = content.gsub(/^.*sdkjs\/cell\/sdk-all.js.*$/, "<file>#{sdk_all_path}/cell/sdk-all.js</file>")
    content = content.gsub(/^.*sdkjs\/cell\/sdk-all-min.js.*$/, "<file>#{sdk_all_path}/cell/sdk-all-min.js</file>")
    File.open(path_to_config, "w") { |file| file << content }
  end

  # Recognize format from script file
  # @param script [String] script content
  # @return [String] type of file `docx`, `xlsx`, `pptx`
  def self.recognize_format_from_script(script)
    script.match(/builder.CreateFile\(\"(.*)\"\)\;/)[1]
  end
end
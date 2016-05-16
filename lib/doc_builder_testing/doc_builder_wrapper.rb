# Class for Wrapping doc building
require 'tempfile'
require 'ooxml_parser'
class DocBuilderWrapper
  # Path to Builder folder
  attr_accessor :builder_home
  # Path to Builder exe
  attr_accessor :builder_exe

  def initialize(builder_home: "#{ENV['HOME']}/.apps/doc-builder/")
    @builder_home = builder_home
    @builder_exe = "#{@builder_home}docbuilder_linux64"
  end

  def build_doc(script_file)
    build_result = `LD_LIBRARY_PATH=#{@builder_home} #{@builder_exe} #{script_file} 2>&1`
    raise DocBuilderError, build_result if build_result.include?('error')
  end

  def build_doc_and_parse(script_file)
    temp_script_data = DocBuilderWrapper.change_output_file(script_file)
    build_doc(temp_script_data[:temp_script_file])
    OoxmlParser::DocxParser.parse_docx(temp_script_data[:temp_output_file])
  end

  def self.change_output_file(script_file)
    temp_output_file = Tempfile.new([File.basename(script_file), '.docx'])
    script_file_content = File.open(script_file, "r").read
    script_file_content.gsub!(/^builder\.SaveFile.*$/, "builder.SaveFile(\"docx\", \"#{temp_output_file.path}\");")
    temp_script_file = Tempfile.new([File.basename(script_file), File.extname(script_file)])
    temp_script_file.write(script_file_content)
    temp_script_file.close
    {temp_script_file: temp_script_file.path, temp_output_file: temp_output_file.path}
  end
end
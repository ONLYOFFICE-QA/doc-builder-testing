# Class for Wrapping doc building
require 'tempfile'
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
    `LD_LIBRARY_PATH=#{@builder_home} #{@builder_exe} #{script_file} 2>&1`
  end

  def self.change_output_file(script_file)
    temp_output_file = Tempfile.new('doc_builder_wrapper_output')
    script_file_content = File.open(script_file, "rb").read
    script_file_content.gsub!(/^builder\.SaveFile.*$/, "builder.SaveFile(\"docx\", \"#{temp_output_file.path}\");")
    temp_script_file = Tempfile.new('doc_builder_wrapper_script')
    temp_script_file.write(script_file_content)
    temp_script_file.close
    {temp_script_file: temp_script_file, temp_output_file: temp_output_file}
  end
end
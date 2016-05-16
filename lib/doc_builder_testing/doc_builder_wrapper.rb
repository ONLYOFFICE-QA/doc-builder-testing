# Class for Wrapping doc building
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
end
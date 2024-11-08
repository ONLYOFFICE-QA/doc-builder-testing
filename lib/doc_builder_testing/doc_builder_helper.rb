# frozen_string_literal: true

# Helpers method for document builder
module DocBuilderHelper
  # Actual verison: 7.2.2
  # [Hash] list of minimal file size by formats
  MINIMAL_FILESIZE = { '.odt' => 3656,
                       '.rtf' => 976,
                       '.pdf' => 734,
                       '.txt' => 5,
                       '.odp' => 3933,
                       '.ods' => 3351,
                       '.csv' => 1,
                       '.epub' => 1758,
                       '.fb2' => 498,
                       '.ott' => 272,
                       '.html' => 4234,
                       '.pdfa' => 4999 }.freeze

  # Parse file
  # @param path [String] file to path
  # @return [Object] parsed object
  def parse(path)
    if File.extname(path) == '.pdf'
      OnlyofficePdfParser::PdfStructure.parse(path)
    else
      OoxmlParser::Parser.parse(path)
    end
  end

  # Check if file empty
  # @param file_path [String] path to file
  # @return [True, False] is file empty
  def file_empty?(file_path)
    File.size?(file_path) <= MINIMAL_FILESIZE[File.extname(file_path)]
  end

  # Wait for file creation
  # @param file_name [String] path to file
  # @return [Nothing]
  def wait_file_creation(file_name)
    creation_timeout = 5
    (0..creation_timeout).each do |_|
      return true if File.exist?(file_name)

      sleep 1
    end
    raise DocBuilderFileCreationError, "File #{file_name} was not creating for #{creation_timeout} seconds"
  end

  # Make a copy of script file, so no need to change output path on real file
  # @param script_file [String] path to actual script file
  # @return [Hash] with data
  def change_output_file(script_file)
    script_file_content = File.read(script_file)
    output_format = recognize_output_format(script_file_content)
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
  # Some script files could not have any SaveFile - do not fail on it
  # @param script [String] script content
  # @return [String] type of file
  def recognize_output_format(script)
    save_file = script.match(/builder.SaveFile\("(.*)",/)
    return nil unless save_file

    save_file[1]
  end
end

# Helpers method for document builder
module DocBuilderHelper
  MINIMAL_FILESIZE = { '.odt' => 3656, '.rtf' => 976, '.pdf' => 734, '.txt' => 5, '.ods' => 3351, '.csv' => 1 }.freeze
  def parse(path)
    OoxmlParser::Parser.parse(path)
  end

  def file_empty?(file_path)
    File.size?(file_path) <= MINIMAL_FILESIZE[File.extname(file_path)]
  end

  # Wait for file creation
  # @param file_name [String] path to file
  # @return [Nothing]
  def wait_file_creation(file_name)
    creation_timeout = 5
    (0..creation_timeout).each do |_|
      return if File.exist?(file_name)
      sleep 1
    end
    raise DocBuilderFileCreationError, "File #{file_name} was not creating for #{creation_timeout} seconds"
  end
end

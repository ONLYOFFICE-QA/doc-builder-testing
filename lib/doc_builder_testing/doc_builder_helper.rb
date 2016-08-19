# Helpers method for document builder
module DocBuilderHelper

  MINIMAL_FILESIZE = { '.odt' => 3656, '.rtf' => 976,'.pdf' => 734, '.txt' => 5,'.ods' => 3351, '.csv' => 1 }
  def parse(path)
    OoxmlParser::Parser.parse(path)
  end

  def file_empty?(file_path)
    File.size?(file_path) <= MINIMAL_FILESIZE[File.extname(file_path)]
  end
end

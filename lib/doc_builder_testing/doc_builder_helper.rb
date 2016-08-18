# Helpers method for document builder
module DocBuilderHelper
  def parse(path)
    OoxmlParser::Parser.parse(path)
  end
end

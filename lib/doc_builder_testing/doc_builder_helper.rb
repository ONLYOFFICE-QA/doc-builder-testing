module DocBuilderHelper
  def parse(path)
    OoxmlParser::Parser.parse(path)
  end
end

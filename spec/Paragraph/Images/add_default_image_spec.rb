require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Text with tabs' do

  it 'Tabs' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_default_image.docx')
    expect(File.size?(docx.elements[1].character_style_array.first.drawing.graphic.data.path_to_image.path_to_media_file)).to be >= 1_000
end
end
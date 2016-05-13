require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Check backgroundcolor' do

  it 'Backgroundcolor' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_backgroundcolor_in_paragraph.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('Green')
    expect(docx.elements[1].background_color).to eq(OoxmlParser::Color.new(0,255,0))
end
end

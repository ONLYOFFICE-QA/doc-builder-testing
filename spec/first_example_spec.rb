require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'My behaviour' do
  it 'Check Diagram offset should !=0' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/Builder/paragraph.docx')
    expect(docx.elements.first.character_style_array.first.text).to eq('test')
  end
end

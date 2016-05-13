require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'My behaviour' do
  it 'Check Diagram offset should !=0' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/paragraph_text.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('test')
  end
end

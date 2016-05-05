require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Add text in header' do
  it 'Check Diagram offset should !=0' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_in_header.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('test')
  end
end

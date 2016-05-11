require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Add text in header' do
  it 'Check enter text in header' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_in_header.docx')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('header')
  end
end

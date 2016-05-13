require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Check keeplines' do

  it 'Keeplines' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_keeplines.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('KeepLines')
    expect(docx.elements[1].keep_lines).to eq(true)
  end

  it 'Keepnext' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_keepnext.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('KeepNext')
    expect(docx.elements[1].keep_next).to eq(true)
  end
end

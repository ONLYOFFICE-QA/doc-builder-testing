require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Check firstline' do

  it 'Firstline should be 0.18' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_firstline_plus.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('Firstline100')
    expect(docx.elements[1].ind.first_line_indent).to eq(0.18)
  end

  it 'Firstline should be 0' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_firstline_minus.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('Firstline-100')
    expect(docx.elements[1].ind.first_line_indent).to eq(0)
  end
end

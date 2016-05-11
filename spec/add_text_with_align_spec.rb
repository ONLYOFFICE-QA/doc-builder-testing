require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Check aligns' do

  it 'Align should be left' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_align_left.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('Left')
    expect(docx.elements[1].align).to eq(:left)
  end

  it 'Align should be right' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_align_right.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('Right')
    expect(docx.elements[1].align).to eq(:right)
  end

  it 'Align should be center' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_align_center.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('Center')
    expect(docx.elements[1].align).to eq(:center)
  end
end

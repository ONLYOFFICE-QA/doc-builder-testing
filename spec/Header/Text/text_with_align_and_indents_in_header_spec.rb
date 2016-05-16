require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Check indents' do

  it 'Align should be right' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/text_in_right_in_header.docx')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('Right')
    expect(docx.notes.first.elements[1].align).to eq(:right)
  end

  it 'Align should be center' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/text_in_centre_in_header.docx')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('Center')
    expect(docx.notes.first.elements[1].align).to eq(:center)
  end

  it 'Indent should be left' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/text_leftindent_in_header.js.docx')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('LeftIndent')
    expect(docx.notes.first.elements[1].ind.left_indent).to eq(2.65)
  end

  it 'Indent should be right' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/text_rightindent_in_header.js.docx')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('RightIndent')
    expect(docx.notes.first.elements[1].ind.right_indent).to eq(1.76)
  end
end

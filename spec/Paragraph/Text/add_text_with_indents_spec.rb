require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Check indents' do

  it 'Indent should be left' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_indentleft.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('LeftIndent')
    expect(docx.elements[1].ind.left_indent).to eq(2.65)
  end

  it 'Indent should be right' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_indentright.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('RightIndent')
    expect(docx.elements[1].ind.right_indent).to eq(1.76)
  end
end

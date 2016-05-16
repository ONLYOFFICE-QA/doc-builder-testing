require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Text with effects' do

  it 'Text shopuld be doublestrikeout' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/text_with_doublestrikeout_in_header.js.docx')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('DoubleStrikeout')
    expect(docx.notes.first.elements[1].character_style_array.first.font_style.strike).to eq(:double)
  end

  it 'Text should be capitals' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/text_with_capitals_in_header.js.docx')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('Capitals')
    expect(docx.notes.first.elements[1].character_style_array.first.caps).to eq(:caps)
  end

  it 'Text should be subscript' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/text_with_subscript_in_header.js.docx')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('Subscript')
    expect(docx.notes.first.elements[1].character_style_array.first.vertical_align).to eq(:subscript)
  end

  it 'Text should be subscript' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/text_with_superscript_in_header.js.docx')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('Superscript')
    expect(docx.notes.first.elements[1].character_style_array.first.vertical_align).to eq(:superscript)
  end

end




require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'My behaviour' do
  it 'Text should be smallcapitals' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_smallcapitals_in_paragraph.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('SmallCapitals')
    expect(docx.elements[1].character_style_array.first.caps).to eq(:small_caps)
  end

  it 'Text shopuld be doublestrikeout' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_doublestrikeout_in_paragraph.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('DoubleStrikeout')
    expect(docx.elements[1].character_style_array.first.font_style.strike).to eq(:double)
  end

  it 'Text should be capitals' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_capitals_in_paragraph.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('Capitals')
    expect(docx.elements[1].character_style_array.first.caps).to eq(:caps)
  end

  it 'Text should be subscript' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_subscript_in_paragraph.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('Subscript')
    expect(docx.elements[1].character_style_array.first.vertical_align).to eq(:subscript)
  end

  it 'Text should be subscript' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_superscript_in_paragraph.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('Superscript')
    expect(docx.elements[1].character_style_array.first.vertical_align).to eq(:superscript)
  end

end




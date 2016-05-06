require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'My behaviour' do
  it 'Text should be subscript' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_superscript_in_paragraph.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('Superscript')
    expect(docx.elements[1].character_style_array.first.vertical_align).to eq(:superscript)
  end
end




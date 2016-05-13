require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Text with tabs' do

  it 'Section' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/pc/Documents/temp_docx/section.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('First Columns')
    expect(docx.elements.last.character_style_array.first.text).to eq('Second Columns')
  end
end
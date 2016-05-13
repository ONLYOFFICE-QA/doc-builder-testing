require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Text with tabs' do

  it 'Add Text in Section' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/pc/Documents/temp_docx/text_in_section.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('First Page')
    expect(docx.elements.last.character_style_array.first.text).to eq('Second Page')
  end

  it 'Add Table in Section' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/pc/Documents/temp_docx/table_in_section.docx')
    expect(docx.element_by_description[1].rows.length).to eq(3)
    expect(docx.element_by_description[1].rows[0].cells.length).to eq(3)
    expect(docx.element_by_description.last.rows.length).to eq(3)
    expect(docx.element_by_description.last.rows[0].cells.length).to eq(3)
  end
end
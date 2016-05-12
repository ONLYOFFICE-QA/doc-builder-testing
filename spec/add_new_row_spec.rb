require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Add new row in table' do

  it 'Add new row in position' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_add_row_in_position.js.docx')
    expect(docx.elements[1].rows.length).to eq(4)
    expect(docx.elements[1].rows[1].cells.first.elements.first.character_style_array[1].text).to eq('NewRow')
  end

  it 'Add new row without position' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_add_row_without_position.js.docx')
    expect(docx.elements[1].rows.length).to eq(4)
    expect(docx.elements[1].rows[3].cells.first.elements.first.character_style_array[1].text).to eq('NewRow')
  end
  end




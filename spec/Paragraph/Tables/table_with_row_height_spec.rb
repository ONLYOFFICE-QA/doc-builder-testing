require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Add table custom rows height' do

  it '1-st row: auto, 2-nd row: 1000, 3-rd row: 2000' do

    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_row_height.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].rows.first.table_row_properties.height).to eq(nil)
    expect(docx.elements[1].rows[1].table_row_properties.height).to eq(1000.0)
    expect(docx.elements[1].rows[2].table_row_properties.height).to eq(2000.0)
  end
end




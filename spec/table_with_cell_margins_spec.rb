require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Add table with cells margins' do

  it 'Table with cell margins: bottom, left, top' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_cell_margins.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells[1].properties.margins.bottom).to eq(0.53)
    expect(docx.elements[1].rows.first.cells[1].properties.margins.left).to eq(0.18)
    expect(docx.elements[1].rows.first.cells[1].properties.margins.top).to eq(0.71)
  end
end




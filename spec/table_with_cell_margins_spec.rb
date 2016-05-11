require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Add table with cells with borders and background' do

  it 'Table with cell background: red' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_cell_margin.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells[1].properties.shd).to eq(OoxmlParser::Color.new(255,0,0))
  end
end




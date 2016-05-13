require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Add table with margins' do

  it 'Table with margins: bottom, top, left, right' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_margins.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.first.properties.margins.bottom).to eq(0.127)
    expect(docx.elements[1].rows.first.cells.first.properties.margins.top).to eq(0.127)
    expect(docx.elements[1].rows.first.cells.first.properties.margins.left).to eq(0.254)
    expect(docx.elements[1].rows.first.cells.first.properties.margins.right).to eq(0.254)
  end
end




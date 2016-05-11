require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Add table with borders' do

  it 'Table with borders' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_borders.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.between.color).to eq(OoxmlParser::Color.new(0,0,0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.between.sz).to eq(0.5)
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.bottom.color).to eq(OoxmlParser::Color.new(0,0,0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.bottom.sz).to eq(0.5)
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.left.color).to eq(OoxmlParser::Color.new(0,0,0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.left.sz).to eq(0.5)
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.right.color).to eq(OoxmlParser::Color.new(0,0,0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.right.sz).to eq(0.5)
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.top.color).to eq(OoxmlParser::Color.new(0,0,0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.top.sz).to eq(0.5)
  end
end




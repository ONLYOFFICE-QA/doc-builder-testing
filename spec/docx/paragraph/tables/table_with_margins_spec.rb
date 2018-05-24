require 'spec_helper'

describe 'Add table with margins' do
  it 'Table with margins: bottom, top, left, right' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/tables/table_with_margins.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].properties.table_cell_margin.bottom).to eq(OoxmlParser::OoxmlSize.new(0.35, :centimeter))
    expect(docx.elements[1].properties.table_cell_margin.top).to eq(OoxmlParser::OoxmlSize.new(0.18, :centimeter))
    expect(docx.elements[1].properties.table_cell_margin.left).to eq(OoxmlParser::OoxmlSize.new(0.7, :centimeter))
    expect(docx.elements[1].properties.table_cell_margin.right).to eq(OoxmlParser::OoxmlSize.new(0.35, :centimeter))
  end
end

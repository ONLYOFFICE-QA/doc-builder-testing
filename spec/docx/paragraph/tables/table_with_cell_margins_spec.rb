# frozen_string_literal: true

require 'spec_helper'

describe 'Add table with cells margins' do
  it 'Table with cell margins: bottom, left, top' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/tables/table_with_cell_margins.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells[1].properties.table_cell_margin.bottom).to eq(OoxmlParser::OoxmlSize.new(0.52, :centimeter))
    expect(docx.elements[1].rows.first.cells[1].properties.table_cell_margin.left).to eq(OoxmlParser::OoxmlSize.new(0.17, :centimeter))
    expect(docx.elements[1].rows.first.cells[1].properties.table_cell_margin.top).to eq(OoxmlParser::OoxmlSize.new(0.7, :centimeter))
  end
end

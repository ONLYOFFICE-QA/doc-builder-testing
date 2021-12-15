# frozen_string_literal: true

require 'spec_helper'

describe 'Add table with cells with borders and background' do
  it 'Table with cell background: red' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/tables/table_with_cell_borders.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells[1].properties.shade.color.upcase)
      .to eq(OoxmlParser::Color.new(255, 0, 0).to_hex.to_sym)
  end

  it 'Table with cell borders: top, left, top, bottom', critical: true do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/tables/table_with_cell_borders.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows[1].cells.first.properties.borders_properties.bottom.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements[1].rows[1].cells.first.properties.borders_properties.bottom.size).to eq(OoxmlParser::OoxmlSize.new(8, :point))
    expect(docx.elements[1].rows[1].cells.first.properties.borders_properties.left.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].rows[1].cells.first.properties.borders_properties.left.size).to eq(OoxmlParser::OoxmlSize.new(4, :point))
    expect(docx.elements[1].rows[1].cells.first.properties.borders_properties.right.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].rows[1].cells.first.properties.borders_properties.right.size).to eq(OoxmlParser::OoxmlSize.new(2, :point))
    expect(docx.elements[1].rows[1].cells.first.properties.borders_properties.top.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements[1].rows[1].cells.first.properties.borders_properties.top.size).to eq(OoxmlParser::OoxmlSize.new(4, :point))
  end
end

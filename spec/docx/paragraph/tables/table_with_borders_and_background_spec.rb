# frozen_string_literal: true

require 'spec_helper'

describe 'Add table with borders and background' do
  it 'Table with borders' do
    docx = builder.build_and_parse('js/docx/paragraph/tables/table_with_borders.js')
    expect(docx.elements[1].rows.length).to eq(3)
    table_borders = docx.elements[1].properties.table_borders
    expect(table_borders.top.color).to eq(OoxmlParser::Color.new(1, 2, 3))
    expect(table_borders.top.size).to eq(OoxmlParser::OoxmlSize.new(1, :point))
    expect(table_borders.bottom.color).to eq(OoxmlParser::Color.new(4, 5, 6))
    expect(table_borders.bottom.size).to eq(OoxmlParser::OoxmlSize.new(2, :point))
    expect(table_borders.left.color).to eq(OoxmlParser::Color.new(7, 8, 9))
    expect(table_borders.left.size).to eq(OoxmlParser::OoxmlSize.new(3, :point))
    expect(table_borders.right.color).to eq(OoxmlParser::Color.new(10, 11, 12))
    expect(table_borders.right.size).to eq(OoxmlParser::OoxmlSize.new(4, :point))
    expect(table_borders.inside_vertical.color).to eq(OoxmlParser::Color.new(13, 14, 15))
    expect(table_borders.inside_vertical.size).to eq(OoxmlParser::OoxmlSize.new(5, :point))
    expect(table_borders.inside_horizontal.color).to eq(OoxmlParser::Color.new(16, 17, 18))
    expect(table_borders.inside_horizontal.size).to eq(OoxmlParser::OoxmlSize.new(6, :point))
  end

  it 'Table with background' do
    docx = builder.build_and_parse('js/docx/paragraph/tables/table_with_background.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].properties.shade.color.upcase)
      .to eq(OoxmlParser::Color.new(255, 0, 0).to_hex.to_sym)
  end
end

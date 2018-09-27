require 'spec_helper'

describe 'Add table with borders and background' do
  it 'Table with borders' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/tables/table_with_borders.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.between.color).to eq(OoxmlParser::Color.new(0, 0, 0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.between.size).to eq(OoxmlParser::OoxmlSize.new(0.5, :point))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.bottom.color).to eq(OoxmlParser::Color.new(0, 0, 0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.bottom.size).to eq(OoxmlParser::OoxmlSize.new(0.5, :point))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.left.color).to eq(OoxmlParser::Color.new(0, 0, 0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.left.size).to eq(OoxmlParser::OoxmlSize.new(0.5, :point))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.right.color).to eq(OoxmlParser::Color.new(0, 0, 0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.right.size).to eq(OoxmlParser::OoxmlSize.new(0.5, :point))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.top.color).to eq(OoxmlParser::Color.new(0, 0, 0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.top.size).to eq(OoxmlParser::OoxmlSize.new(0.5, :point))
  end

  it 'Table with background' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/tables/table_with_background.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].properties.shade.fill).to eq(OoxmlParser::Color.new(255, 0, 0))
  end
end

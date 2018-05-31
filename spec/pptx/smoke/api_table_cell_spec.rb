require 'spec_helper'
describe 'Api Table Cell section tests' do
  it 'Api | GetClassType method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_table_cell/get_class_type.js')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.text_body.paragraphs[0].runs.first.text).to eq('tableCell')
  end

  it 'Api | GetContent method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_table_cell/get_content.js')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.text_body.paragraphs[0].runs.first.text).to eq('cell1')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells[1].text_body.paragraphs[0].runs.first.text).to eq('cell2')
  end

  it 'Api | SetCellMarginBottom method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_table_cell/set_cell_margin_bottom.js')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.properties.margins.bottom).to eq(OoxmlParser::OoxmlSize.new(1000, :twip))
  end

  it 'Api | SetCellMarginLeft method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_table_cell/set_cell_margin_left.js')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.properties.margins.left).to eq(OoxmlParser::OoxmlSize.new(1000, :twip))
  end

  it 'Api | SetCellMarginRight method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_table_cell/set_cell_margin_right.js')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.properties.margins.right).to eq(OoxmlParser::OoxmlSize.new(1000, :twip))
  end

  it 'Api | SetCellMarginTop method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_table_cell/set_cell_margin_top.js')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.properties.margins.top).to eq(OoxmlParser::OoxmlSize.new(1000, :twip))
  end

  it 'Api | SetCellBorderBottom method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_table_cell/set_cell_border_bottom.js')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.properties.borders.bottom.width).to eq(OoxmlParser::OoxmlSize.new(0.5, :centimeter))
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.properties.borders.bottom.fill.color).to eq(OoxmlParser::Color.new(255, 0, 0))
  end

  it 'Api | SetCellBorderLeft method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_table_cell/set_cell_border_left.js')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.properties.borders.left.width).to eq(OoxmlParser::OoxmlSize.new(0.5, :centimeter))
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.properties.borders.left.fill.color).to eq(OoxmlParser::Color.new(255, 0, 0))
  end

  it 'Api | SetCellBorderRight method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_table_cell/set_cell_border_right.js')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.properties.borders.right.width).to eq(OoxmlParser::OoxmlSize.new(0.5, :centimeter))
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.properties.borders.right.fill.color).to eq(OoxmlParser::Color.new(255, 0, 0))
  end
end

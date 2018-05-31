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
end

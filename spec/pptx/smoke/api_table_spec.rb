require 'spec_helper'
describe 'Api Table section tests' do
  it 'Api | GetClassType method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_table/get_class_type.js')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.text_body.paragraphs[0].runs.first.text).to eq('table')
  end

  it 'Api | GetRow method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_table/get_row.js')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.text_body.paragraphs[0].runs.first.text).to eq('row1')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows[2].cells.first.text_body.paragraphs[0].runs.first.text).to eq('row2')
  end

  it 'Api | AddRow method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_table/add_row.js')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.first.text_body.paragraphs[0].runs.first.text).to eq('row1')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows[1].cells.first.text_body.paragraphs[0].runs.first.text).to eq('row2')
  end

  it 'Api | AddColumn method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_table/add_column.js')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells[1].text_body.paragraphs[0].runs.first.text).to eq('added_column')
  end
end

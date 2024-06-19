# frozen_string_literal: true

require 'spec_helper'
describe 'ApiTableCell section tests' do
  it 'ApiTableCell | ApiTableCell | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/get_class_type.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | ApiTableCell | GetContent method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/get_content.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellBorderBottom method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/set_cell_border_bottom.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellBorderLeft method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/set_cell_border_left.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellBorderRight method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/set_cell_border_right.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellBorderTop method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/set_cell_border_top.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellMarginBottom method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/set_cell_margin_bottom.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellMarginLeft method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/set_cell_margin_left.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellMarginRight method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/set_cell_margin_right.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellMarginTop method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/set_cell_margin_top.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | ApiTableCell | SetNoWrap method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/set_no_wrap.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | ApiTableCell | SetShd method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/set_shd.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | ApiTableCell | SetTextDirection method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/set_text_direction.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | ApiTableCell | SetVerticalAlign method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/set_vertical_align.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | ApiTableCell | SetWidth method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/set_width.js')
    expect(docx.nil?).to be(false)
  end

  it 'ApiTableCell | SetWidth method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_cell/to_json.js')
    json = JSON.parse(docx.elements[3].nonempty_runs[0].text)
    cell = docx.elements[1].rows[0].cells[0]

    expect(cell.properties.table_cell_margin.bottom.value).to eq(json['tcMar']['bottom']['w'])
    expect(cell.properties.table_cell_margin.top.value).to eq(json['tcMar']['top']['w'])
    expect(cell.properties.table_cell_margin.left.value).to eq(json['tcMar']['left']['w'])
    expect(cell.properties.table_cell_margin.right.value).to eq(json['tcMar']['right']['w'])

    expect(cell.properties.borders_properties.bottom.val.to_s).to eq(json['tcBorders']['bottom']['value'])
    expect(cell.properties.borders_properties.top.val.to_s).to eq(json['tcBorders']['top']['value'])
    expect(cell.properties.borders_properties.left.val.to_s).to eq(json['tcBorders']['start']['value'])
    expect(cell.properties.borders_properties.right.val.to_s).to eq(json['tcBorders']['end']['value'])

    expect(cell.properties.text_direction).to eq(:bottom_to_top_left_to_right)
    expect(cell.properties.table_cell_width.value.to_i).to eq(json['tcW']['w'])
  end
end

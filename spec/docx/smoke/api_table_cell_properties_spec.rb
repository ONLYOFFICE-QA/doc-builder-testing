# frozen_string_literal: true

require 'spec_helper'
describe 'ApiTableCellPr section tests' do
  it 'ApiTableCellPr | GetClassType method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_cell_pr/get_class_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = tableCellPr')
  end

  it 'ApiTableCellPr | SetCellBorderBottom method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_cell_pr/set_cell_border_bottom.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.bottom.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.bottom.size).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.bottom.val).to eq(:single)
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.bottom.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTableCellPr | SetCellBorderLeft method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_cell_pr/set_cell_border_left.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.left.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.left.size).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.left.val).to eq(:single)
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.left.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTableCellPr | SetCellBorderRight method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_cell_pr/set_cell_border_right.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.right.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.right.size).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.right.val).to eq(:single)
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.right.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTableCellPr | SetCellBorderTop method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_cell_pr/set_cell_border_top.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.top.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.top.size).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.top.val).to eq(:single)
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.top.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTableCellPr | SetCellMarginBottom method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_cell_pr/set_cell_margin_bottom.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.table_cell_margin.bottom).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableCellPr | SetCellMarginLeft method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_cell_pr/set_cell_margin_left.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.table_cell_margin.left).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableCellPr | SetCellMarginRight method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_cell_pr/set_cell_margin_right.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.table_cell_margin.right).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableCellPr | SetCellMarginTop method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_cell_pr/set_cell_margin_top.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.table_cell_margin.top).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableCellPr | SetNoWrap method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_cell_pr/set_no_wrap.js')
    expect(docx.elements[1].rows.first.cells.first.properties.no_wrap).to be_truthy
  end

  it 'ApiTableCellPr | SetShd method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_cell_pr/set_shd.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.shade.color).to eq(OoxmlParser::Color.new(255, 104, 0).to_hex.to_sym)
  end

  it 'ApiTableCellPr | SetTextDirection method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_cell_pr/set_text_direction.js')
    expect(docx.elements[1].rows.first.cells.first.properties.text_direction).to eq(:bottom_to_top_left_to_right)
  end

  it 'ApiTableCellPr | SetVerticalAlign method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_cell_pr/set_vertical_align.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.vertical_align).to eq(:bottom)
  end

  it 'ApiTableCellPr | SetWidth method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_cell_pr/set_width.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.table_cell_width).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end
end

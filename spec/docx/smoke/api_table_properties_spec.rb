# frozen_string_literal: true

require 'spec_helper'
describe 'ApiTablePr section tests' do
  it 'ApiTablePr | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/get_class_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = tablePr')
  end

  it 'ApiTablePr | SetCellSpacing method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_cell_spacing.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_spacing).to eq(OoxmlParser::OoxmlSize.new(360, :twip))
  end

  it 'ApiTablePr | SetJc method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_jc.js')
    expect(docx.elements[1].properties.table_style.table_properties.jc).to eq(:center)
  end

  it 'ApiTablePr | SetShd method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_shd.js')
    expect(docx.elements[1].properties.table_style.table_properties.shade.color.upcase)
      .to eq(OoxmlParser::Color.new(238, 238, 238).to_hex.to_sym)
  end

  it 'ApiTablePr | SetStyleColBandSize method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_style_col_band_size.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_style_column_band_size.value).to eq(2)
  end

  it 'ApiTablePr | SetStyleRowBandSize method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_style_row_band_size.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_style_row_band_size.value).to eq(2)
  end

  it 'ApiTablePr | SetTableBorderBottom method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_table_border_bottom.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.bottom.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.bottom.val).to eq(:single)
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.bottom.size).to eq(OoxmlParser::OoxmlSize.new(32.0, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.bottom.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTablePr | SetTableBorderInsideH method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_table_border_inside_h.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_horizontal.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_horizontal.val).to eq(:single)
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_horizontal.size).to eq(OoxmlParser::OoxmlSize.new(32.0, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_horizontal.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTablePr | SetTableBorderInsideV method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_table_border_inside_v.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_vertical.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_vertical.val).to eq(:single)
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_vertical.size).to eq(OoxmlParser::OoxmlSize.new(32.0, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_vertical.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTablePr | SetTableBorderLeft method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_table_border_left.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.left.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.left.val).to eq(:single)
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.left.size).to eq(OoxmlParser::OoxmlSize.new(32.0, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.left.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTablePr | SetTableBorderRight method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_table_border_right.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.right.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.right.val).to eq(:single)
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.right.size).to eq(OoxmlParser::OoxmlSize.new(32.0, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.right.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTablePr | SetTableBorderTop method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_table_border_top.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.top.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.top.val).to eq(:single)
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.top.size).to eq(OoxmlParser::OoxmlSize.new(32.0, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.top.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTablePr | SetTableCellMarginBottom method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_table_cell_margin_bottom.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.bottom).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTablePr | SetTableCellMarginLeft method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_table_cell_margin_left.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.left).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTablePr | SetTableCellMarginRight method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_table_cell_margin_right.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.right).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTablePr | SetTableCellMarginTop method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_table_cell_margin_top.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.top).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTablePr | SetTableInd method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_table_ind.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_indent).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiTablePr | SetWidth method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/set_width.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_width).to eq(OoxmlParser::OoxmlSize.new(100, :percent))
  end
end

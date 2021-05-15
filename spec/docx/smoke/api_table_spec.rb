# frozen_string_literal: true

require 'spec_helper'
describe 'ApiTable section tests' do
  it 'ApiTable | AddColumn method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/add_column.js')
    expect(docx.elements[1].rows.count).to eq(2)
    expect(docx.elements[1].rows.first.cells.count).to eq(3)
  end

  it 'ApiTable | AddRow method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/add_row.js')
    expect(docx.elements[1].rows.count).to eq(3)
    expect(docx.elements[1].rows.first.cells.count).to eq(2)
  end

  it 'ApiTable | GetClassType method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/get_class_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = table')
  end

  it 'ApiTable | GetRow method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/get_row.js')
    expect(docx.elements[1].rows.count).to eq(3)
    expect(docx.elements[1].rows.first.cells.count).to eq(2)
  end

  it 'ApiTable | GetRowsCount method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/get_rows_count.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('We create a 2x2 table and add a new row, so that it becomes 2x3:')
    expect(docx.elements[3].nonempty_runs.first.text).to eq('The table above had 2 rows before we added a new one. ')
  end

  it 'ApiTable | MergeCells method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/merge_cells.js')
    expect(docx.elements[1].rows[1].cells[1].properties.grid_span.value).to eq(2)
    expect(docx.elements[1].rows[1].cells.count).to eq(4)
    expect(docx.elements[1].rows[0].cells.count).to eq(5)
  end

  it 'ApiTable | RemoveColumn method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/remove_column.js')
    expect(docx.elements[1].rows.count).to eq(3)
    expect(docx.elements[1].rows.first.cells.count).to eq(2)
  end

  it 'ApiTable | RemoveRow method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/remove_row.js')
    expect(docx.elements[1].rows.count).to eq(2)
    expect(docx.elements[1].rows.first.cells.count).to eq(3)
  end

  it 'ApiTable | SetCellSpacing method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_cell_spacing.js')
    expect(docx.elements[1].properties.table_cell_spacing).to eq(OoxmlParser::OoxmlSize.new(360, :twip))
  end

  it 'ApiTable | SetJc method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_jc.js')
    expect(docx.elements[1].properties.jc).to eq(:center)
  end

  it 'ApiTable | SetShd method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_shd.js')
    expect(docx.elements[1].properties.shade.color).to eq(OoxmlParser::Color.new(238, 238, 238).to_hex.to_sym)
    expect(docx.elements[1].properties.shade.value).to eq(:clear)
  end

  it 'ApiTable | SetStyle method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_style.js')
    expect(docx.elements[1].properties.table_style.name).to eq('Bordered - Accent 5')
  end

  it 'ApiTable | SetStyleColBandSize method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_style_col_band_size.js')
    expect(docx.elements[1].properties.table_style_column_band_size.value).to eq(2)
  end

  it 'ApiTable | SetStyleRowBandSize method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_style_row_band_size.js')
    expect(docx.elements[1].properties.table_style_row_band_size.value).to eq(2)
  end

  it 'ApiTable | SetTableBorderBottom method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_table_border_bottom.js')
    expect(docx.elements[1].properties.table_borders.bottom.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_borders.bottom.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_borders.bottom.size).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_borders.bottom.val).to eq(:single)
  end

  it 'ApiTable | SetTableBorderInsideH method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_table_border_inside_h.js')
    expect(docx.elements[1].properties.table_borders.inside_horizontal.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements[1].properties.table_borders.inside_horizontal.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_borders.inside_horizontal.size).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_borders.inside_horizontal.val).to eq(:single)
  end

  it 'ApiTable | SetTableBorderInsideV method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_table_border_inside_v.js')
    expect(docx.elements[1].properties.table_borders.inside_vertical.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements[1].properties.table_borders.inside_vertical.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_borders.inside_vertical.size).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_borders.inside_vertical.val).to eq(:single)
  end

  it 'ApiTable | SetTableBorderLeft method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_table_border_left.js')
    expect(docx.elements[1].properties.table_borders.left.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_borders.left.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_borders.left.size).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_borders.left.val).to eq(:single)
  end

  it 'ApiTable | SetTableBorderRight method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_table_border_right.js')
    expect(docx.elements[1].properties.table_borders.right.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_borders.right.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_borders.right.size).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_borders.right.val).to eq(:single)
  end

  it 'ApiTable | SetTableBorderTop method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_table_border_top.js')
    expect(docx.elements[1].properties.table_borders.top.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_borders.top.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_borders.top.size).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_borders.top.val).to eq(:single)
  end

  it 'ApiTable | SetTableCellMarginBottom method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_table_cell_margin_bottom.js')
    expect(docx.elements[1].properties.table_cell_margin.bottom).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTable | SetTableCellMarginLeft method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_table_cell_margin_left.js')
    expect(docx.elements[1].properties.table_cell_margin.left).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTable | SetTableCellMarginRight method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_table_cell_margin_right.js')
    expect(docx.elements[1].properties.table_cell_margin.right).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTable | SetTableCellMarginTop method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_table_cell_margin_top.js')
    expect(docx.elements[1].properties.table_cell_margin.top).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTable | SetTableInd method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_table_ind.js')
    expect(docx.elements[1].properties.table_indent).to eq(OoxmlParser::OoxmlSize.new(1440, :dxa))
  end

  it 'ApiTable | SetTableLayout method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_table_layout.js')
    expect(docx.elements[1].table_properties.table_layout.type).to eq(:fixed)
  end

  it 'ApiTable | SetTableLook method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_table_look.js')
    expect(docx.elements[1].properties.table_look.first_column).to be_truthy
    expect(docx.elements[1].properties.table_style.table_style_properties_list
               .first.table_cell_properties.shade.color)
      .to eq(OoxmlParser::Color.new(255, 0, 0).to_hex.to_sym)
    expect(docx.elements[1].properties.table_look.first_row).to be_truthy
    expect(docx.elements[1].properties.table_look.last_column).to be_truthy
    expect(docx.elements[1].properties.table_look.first_row).to be_truthy
    expect(docx.elements[1].properties.table_look.no_horizontal_banding).to be_falsey
    expect(docx.elements[1].properties.table_look.no_vertical_banding).to be_falsey
  end

  it 'ApiTable | SetWidth method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table/set_width.js')
    expect(docx.elements[1].properties.table_width).to eq(OoxmlParser::OoxmlSize.new(100, :percent))
  end
end

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
end

# frozen_string_literal: true

require 'spec_helper'

describe 'ApiRange Set and get column/row size' do
  it 'ApiRange | SetColumnWidth method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_column_width.js')
    expect(xlsx.worksheets.first.columns.first.width.to_i).to eq(15)
  end

  it 'ApiRange | SetRowHeight method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_row_height.js')
    expect(xlsx.worksheets.first.rows.first.height).to eq(OoxmlParser::OoxmlSize.new(15, :point))
  end

  it 'ApiRange | GetRowHeight method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/get_row_height.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('15')
  end

  it 'ApiRange | GetColumnWidth method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/get_column_width.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('15')
  end

  it 'ApiRange | ColumnWidth getter' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/column_width_getter.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('15')
  end

  it 'ApiRange | RowHeight getter' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/row_height_getter.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('30')
  end
end

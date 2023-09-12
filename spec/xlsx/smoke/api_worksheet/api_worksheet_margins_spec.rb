# frozen_string_literal: true

require 'spec_helper'
describe 'ApiWorksheet Margins' do
  it 'ApiWorksheet | LeftMargin property', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/left_margin_property.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('50')
  end

  it 'ApiWorksheet | SetLeftMargin and GetLeftMargin methods', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/set_and_get_left_margin.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('50')
  end

  it 'ApiWorksheet | RightMargin property', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/right_margin_property.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('50')
  end

  it 'ApiWorksheet | SetRightMargin and GetRightMargin methods', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/set_and_get_right_margin.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('50')
  end

  it 'ApiWorksheet | SetTopMargin and GetTopMargin methods', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/set_and_get_top_margin.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('50')
  end

  it 'ApiWorksheet | BottomMargin property', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/bottom_margin_property.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('50')
  end

  it 'ApiWorksheet | SetBottomMargin and GetBottomMargin methods', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/set_and_get_bottom_margin.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('50')
  end
end

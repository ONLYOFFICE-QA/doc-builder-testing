# frozen_string_literal: true

require 'spec_helper'
describe 'Worksheet Api regression' do
  it 'GetCells | 56159' do
    xlsx = builder.build_and_parse('js/xlsx/regression/api_worksheet/56159.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.raw_text).to eq('first cell')
  end
end

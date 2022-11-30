# frozen_string_literal: true

require 'spec_helper'
describe 'Worksheet Api regression' do
  it 'GetCells | bug 56159' do
    xlsx = builder.build_and_parse('js/xlsx/specific/bug_56159.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.raw_text).to eq('first cell')
  end
end

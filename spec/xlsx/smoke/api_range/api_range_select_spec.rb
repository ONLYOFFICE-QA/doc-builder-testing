# frozen_string_literal: true

require 'spec_helper'

describe 'ApiRange Select' do
  it 'ApiRange | Select return correct selected text' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/select.js')
    first_row = xlsx.worksheets.first.rows.first.cells
    expect(first_row[0].text).to eq('selected')
    expect(first_row[1].text).to eq('selected')
    expect(first_row[2].text).to eq('selected')
  end
end

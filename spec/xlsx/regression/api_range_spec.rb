# frozen_string_literal: true

require 'spec_helper'
describe 'Range Api regression' do
  it 'Find | 67358' do
    xlsx = builder.build_and_parse('js/xlsx/specific/api_range/67358.js')
    expect(xlsx.worksheets.first.rows[7].cells[6].raw_text).to eq('1')
    expect(xlsx.worksheets.first.rows[7].cells[6].style.fill_color.pattern_fill.background_color).to eq(OoxmlParser::Color.new(255, 213, 191))
  end
end

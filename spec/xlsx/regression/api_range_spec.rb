# frozen_string_literal: true

require 'spec_helper'
describe 'Range Api regression' do
  it 'Find | 67358' do
    xlsx = builder.build_and_parse('js/xlsx/regression/api_range/67358.js')
    expect(xlsx.worksheets.first.rows[7].cells[6].raw_text).to eq('1')
    expect(xlsx.worksheets.first.rows[7].cells[6].style.fill_color.pattern_fill.background_color).to eq(OoxmlParser::Color.new(255, 213, 191))
  end

  it 'RecalculateAllFormulas | 66605' do
    skip('Test require local file to open and not available in web builder') if web_builder?
    xlsx = builder.build_and_parse('js/xlsx/regression/api_range/66605.js')
    expect(xlsx.worksheets[1].rows[8].cells[4].raw_text).to eq('0')
    # TODO: https://bugzilla.onlyoffice.com/show_bug.cgi?id=71637
    # expect(JSON.parse(xlsx.worksheets[1].rows[10].cells[0])).to have_no_empty_string_values
    # expect(xlsx.worksheets[1].rows[11].cells[0]).to eq('true')
  end
end

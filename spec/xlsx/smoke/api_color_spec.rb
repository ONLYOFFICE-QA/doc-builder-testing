# frozen_string_literal: true

require 'spec_helper'
describe 'ApiColor section tests' do
  it 'ApiColor | GetColorType method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_color/get_class_type.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].text).to eq('Text with color')
    expect(xlsx.worksheets.first.rows[3].cells[0].text).to eq('Class type = color')
  end
end

# frozen_string_literal: true

require 'spec_helper'
describe 'ApiUniColor section tests' do
  it 'ApiUniColor | GetClassType method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_uni_color/get_class_type.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('presetColor')
  end
end

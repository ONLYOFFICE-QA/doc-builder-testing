# frozen_string_literal: true

require 'spec_helper'
describe 'ApiImage section tests' do
  it 'ApiImage | GetClassType method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_image/get_class_type.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('image')
  end
end

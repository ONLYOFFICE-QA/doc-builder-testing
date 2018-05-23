require 'spec_helper'
describe 'ApiFill section tests' do
  it 'ApiFill | GetClassType method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_fill/get_class_type.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('fill')
  end
end

require 'spec_helper'
describe 'ApiStroke section tests' do
  it 'ApiStroke | GetClassType method' do
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_stroke/get_class_type.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('stroke')
  end
end

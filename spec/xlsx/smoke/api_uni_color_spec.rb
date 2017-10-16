require 'spec_helper'
describe 'ApiUniColor section tests' do
  it 'ApiUniColor | GetClassType method' do
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_uni_color/get_class_type.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('presetColor')
  end
end

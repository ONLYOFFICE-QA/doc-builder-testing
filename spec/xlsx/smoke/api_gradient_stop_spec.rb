require 'spec_helper'
describe 'ApiGradientStop section tests' do
  it 'ApiGradientStop | GetClassType method' do
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_gradient_stop/get_class_type.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('gradientStop')
  end
end

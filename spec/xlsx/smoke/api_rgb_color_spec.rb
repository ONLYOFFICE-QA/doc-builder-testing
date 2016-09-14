require 'spec_helper'
describe 'ApiRgbColor section tests' do
  it 'ApiRgbColor | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_rgb_color/get_class_type.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('rgbColor')
  end
end

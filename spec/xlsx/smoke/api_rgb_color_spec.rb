require 'spec_helper'
describe 'ApiRgbColor section tests' do
  it 'ApiRgbColor | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_rgb_color/get_class_type.js')
    expect(xlsx).to be_with_data
  end
end

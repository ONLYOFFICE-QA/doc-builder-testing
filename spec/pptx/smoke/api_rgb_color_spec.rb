require 'spec_helper'
describe 'ApiRgbColor section tests' do
  it 'ApiRgbColor | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_rgb_color/get_class_type.js')
    expect(pptx).to be_with_data
  end
end

require 'spec_helper'
describe 'ApiPresetColor section tests' do
  it 'ApiPresetColor | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_preset_color/get_class_type.js')
    expect(pptx).to be_with_data
  end
end

require 'spec_helper'
describe 'ApiPresetColor section tests' do
  it 'ApiPresetColor | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_preset_color/get_class_type.js')
    expect(xlsx).to be_with_data
  end
end

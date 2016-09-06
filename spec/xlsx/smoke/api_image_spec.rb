require 'spec_helper'
describe 'ApiImage section tests' do
  it 'ApiImage | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_image/get_class_type.js')
    expect(xlsx).to be_with_data
  end
end

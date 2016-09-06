require 'spec_helper'
describe 'ApiSchemeColor section tests' do
  it 'ApiSchemeColor | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_scheme_color/get_class_type.js')
    expect(xlsx).to be_with_data
  end
end

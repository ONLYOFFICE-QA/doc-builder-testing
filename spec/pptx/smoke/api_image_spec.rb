require 'spec_helper'
describe 'ApiImage section tests' do
  it 'ApiImage | GetClassType method' do
    pending('https://github.com/ONLYOFFICE/ooxml_parser/issues/254')
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_image/get_class_type.js')
    expect(pptx).to be_with_data
  end
end

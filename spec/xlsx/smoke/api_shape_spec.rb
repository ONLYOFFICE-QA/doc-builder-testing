require 'spec_helper'
describe 'ApiShape section tests' do
  it 'ApiShape | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_shape/get_class_type.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiShape | GetDocContent method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_shape/get_doc_content.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiShape | SetVerticalTextAlign method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_shape/set_vertical_text_align.js')
    expect(xlsx).to be_with_data
  end
end

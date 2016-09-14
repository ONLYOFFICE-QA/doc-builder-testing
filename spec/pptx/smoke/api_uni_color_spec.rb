require 'spec_helper'
describe 'ApiUniColor section tests' do
  it 'ApiUniColor | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiUniColor/getclasstype.js')
    expect(pptx.nil?).to eq(false)
  end
end

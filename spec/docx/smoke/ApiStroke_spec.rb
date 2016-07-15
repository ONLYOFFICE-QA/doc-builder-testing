require 'spec_helper'
describe 'ApiStroke section tests' do
  it 'ApiStroke | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStroke/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end
end

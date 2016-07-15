require 'spec_helper'
describe 'ApiFill section tests' do
  it 'ApiFill | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiFill/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end
end

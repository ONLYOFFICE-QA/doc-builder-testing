require 'spec_helper'
describe 'ApiShape section tests' do
  it 'ApiShape | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiShape/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiShape | GetDocContent method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiShape/getdoccontent.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiShape | SetVerticalTextAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiShape/setverticaltextalign.js')
    expect(docx.nil?).to eq(false)
  end
end

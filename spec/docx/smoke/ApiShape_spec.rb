require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiShape sectin tests' do
  it 'GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiShape/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetDocContent method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiShape/getdoccontent.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetVerticalTextAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiShape/setverticaltextalign.js')
    expect(docx.nil?).to eq(false)
  end
end

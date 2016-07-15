require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiGradientStop section tests' do
  it 'ApiGradientStop | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiGradientStop/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end
end

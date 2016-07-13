require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiRGBColor section tests' do
  it 'ApiRGBColor | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRGBColor/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end
end

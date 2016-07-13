require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiImage sectin tests' do
  it 'GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiImage/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end
end

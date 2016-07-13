require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiNumbering sectin tests' do
  it 'GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumbering/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetLevel method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumbering/getlevel.js')
    expect(docx.nil?).to eq(false)
  end
end

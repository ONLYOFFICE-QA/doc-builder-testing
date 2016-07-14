require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiNumbering section tests' do
  it 'ApiNumbering | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumbering/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiNumbering | GetLevel method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumbering/getlevel.js')
    expect(docx.nil?).to eq(false)
  end
end

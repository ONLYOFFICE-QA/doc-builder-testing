require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiTableStylePr sectin tests' do
  it 'GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetParaPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/getparapr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetTableCellPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettablecellpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetTablePr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettablepr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetTableRowPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettablerowpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetTextPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettextpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettype.js')
    expect(docx.nil?).to eq(false)
  end
end

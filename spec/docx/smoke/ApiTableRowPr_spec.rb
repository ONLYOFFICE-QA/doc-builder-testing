require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiTableRowPr section tests' do
 it 'ApiTableRowPr | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRowPr/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

 it 'ApiTableRowPr | SetHeight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRowPr/setheight.js')
    expect(docx.nil?).to eq(false)
  end

 it 'ApiTableRowPr | SetTableHeader method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRowPr/settableheader.js')
    expect(docx.nil?).to eq(false)
  end
end

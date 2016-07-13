require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiTableRow section tests' do
  it 'ApiTableRow | GetCell method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/getcell.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableRow | GetCellsCount method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/getcellscount.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableRow | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableRow | SetHeight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/setheight.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableRow | SetTableHeader method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/settableheader.js')
    expect(docx.nil?).to eq(false)
  end
end

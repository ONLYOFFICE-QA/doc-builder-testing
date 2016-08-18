require 'spec_helper'
describe 'ApiTableStylePr section tests' do
  it 'ApiTableStylePr | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableStylePr | GetParaPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/getparapr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableStylePr | GetTableCellPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettablecellpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableStylePr | GetTablePr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettablepr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableStylePr | GetTableRowPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettablerowpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableStylePr | GetTextPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettextpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableStylePr | GetType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettype.js')
    expect(docx.nil?).to eq(false)
  end
end

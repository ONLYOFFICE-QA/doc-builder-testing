require 'spec_helper'
describe 'ApiStyle section tests' do
  it 'ApiStyle | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiStyle | GetConditionalTableStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/getconditionaltablestyle.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiStyle | GetName method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/getname.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiStyle | GetParaPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/getparapr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiStyle | GetTableCellPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettablecellpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiStyle | GetTablePr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettablepr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiStyle | GetTableRowPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettablerowpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiStyle | GetTextPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettextpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiStyle | GetType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiStyle | SetBasedOn method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/setbasedon.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiStyle | SetName method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/setname.js')
    expect(docx.nil?).to eq(false)
  end
end

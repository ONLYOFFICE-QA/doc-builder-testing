require 'spec_helper'
describe 'ApiNumberingLevel section tests' do
  it 'ApiNumberingLevel | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiNumberingLevel | GetLevelIndex method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/getlevelindex.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiNumberingLevel | GetNumbering method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/getnumbering.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiNumberingLevel | GetParaPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/getparapr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiNumberingLevel | GetTextPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/gettextpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiNumberingLevel | SetCustomType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/setcustomtype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiNumberingLevel | SetRestart method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/setrestart.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiNumberingLevel | SetStart method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/setstart.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiNumberingLevel | SetSuff method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/setsuff.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiNumberingLevel | SetTemplateType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/settemplatetype.js')
    expect(docx.nil?).to eq(false)
  end
end

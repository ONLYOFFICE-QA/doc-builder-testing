require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiNumberingLevel sectin tests' do
  it 'GetClassType method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/getclasstype.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetLevelIndex method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/getlevelindex.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetNumbering method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/getnumbering.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetParaPr method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/getparapr.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetTextPr method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/gettextpr.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCustomType method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/setcustomtype.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetRestart method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/setrestart.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetStart method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/setstart.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetSuff method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/setsuff.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTemplateType method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/settemplatetype.js')
      expect(docx.nil?).to eq(false)
  end

end
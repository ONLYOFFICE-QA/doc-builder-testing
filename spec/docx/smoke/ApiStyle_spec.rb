require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiStyle sectin tests' do
  it 'GetClassType method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/getclasstype.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetConditionalTableStyle method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/getconditionaltablestyle.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetName method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/getname.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetParaPr method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/getparapr.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetTableCellPr method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettablecellpr.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetTablePr method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettablepr.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetTableRowPr method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettablerowpr.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetTextPr method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettextpr.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetType method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettype.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetBasedOn method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/setbasedon.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetName method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/setname.js')
      expect(docx.nil?).to eq(false)
  end

end
require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiDocument sectin tests' do
  it 'AddElement method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/addelement.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateNumbering method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/createnumbering.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateSection method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/createsection.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateStyle method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/createstyle.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetClassType method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getclasstype.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetDefaultParaPr method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getdefaultparapr.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetDefaultStyle method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getdefaultstyle.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetDefaultTextPr method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getdefaulttextpr.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetElement method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getelement.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetElementsCount method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getelementscount.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetFinalSection method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getfinalsection.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetStyle method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getstyle.js')
      expect(docx.nil?).to eq(false)
  end

  it 'Push method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/push.js')
      expect(docx.nil?).to eq(false)
  end

  it 'RemoveAllElements method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/removeallelements.js')
      expect(docx.nil?).to eq(false)
  end

  it 'RemoveElement method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/removeelement.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetEvenAndOddHdrFtr method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/setevenandoddhdrftr.js')
      expect(docx.nil?).to eq(false)
  end

end
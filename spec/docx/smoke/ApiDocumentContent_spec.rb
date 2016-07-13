require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiDocumentContent section tests' do
  it 'ApiDocumentContent | AddElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocumentContent/addelement.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocumentContent | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocumentContent/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocumentContent | GetElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocumentContent/getelement.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocumentContent | GetElementsCount method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocumentContent/getelementscount.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocumentContent | Push method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocumentContent/push.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocumentContent | RemoveAllElements method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocumentContent/removeallelements.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocumentContent | RemoveElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocumentContent/removeelement.js')
    expect(docx.nil?).to eq(false)
  end
end

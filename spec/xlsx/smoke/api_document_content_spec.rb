require 'spec_helper'
describe 'ApiDocumentContent section tests' do
  it 'ApiDocumentContent | AddElement method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_document_content/add_element.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiDocumentContent | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_document_content/get_class_type.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiDocumentContent | GetElement method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_document_content/get_element.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiDocumentContent | GetElementsCount method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_document_content/get_elements_count.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiDocumentContent | Push method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_document_content/push.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiDocumentContent | RemoveAllElements method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_document_content/remove_all_elements.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiDocumentContent | RemoveElement method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_document_content/remove_element.js')
    expect(xlsx).to be_with_data
  end
end

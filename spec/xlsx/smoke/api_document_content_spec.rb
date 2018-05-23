require 'spec_helper'
describe 'ApiDocumentContent section tests' do
  it 'ApiDocumentContent | AddElement method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_document_content/add_element.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[1].runs.first.text).to eq('We removed all elements from the shape and added a new paragraph inside it.')
  end

  it 'ApiDocumentContent | GetClassType method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_document_content/get_class_type.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.first.text).to eq('Class Type = documentContent')
  end

  it 'ApiDocumentContent | GetElement method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_document_content/get_element.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.size).to eq(4)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.align).to eq(:center)
  end

  it 'ApiDocumentContent | GetElementsCount method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_document_content/get_elements_count.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].text).to eq('Number of elements inside the shape: 1')
  end

  it 'ApiDocumentContent | Push method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_document_content/push.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[1].properties.align).to eq(:left)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[1].runs.first.text).to eq('We removed all elements from the shape and added a new paragraph inside it.')
  end

  it 'ApiDocumentContent | RemoveAllElements method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_document_content/remove_all_elements.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.size).to eq(2)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[1].runs.first.text).to eq('We removed all elements from the shape and added a new paragraph inside it.')
  end

  it 'ApiDocumentContent | RemoveElement method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_document_content/remove_element.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.size).to eq(5)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[1].runs.first.text).to eq('This is paragraph #2.')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[2].runs.first.text).to eq('This is paragraph #4.')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[4].runs.first.text).to eq('We removed paragraph #3, check that out above.')
  end
end

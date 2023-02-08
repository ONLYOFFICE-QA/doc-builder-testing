# frozen_string_literal: true

require 'spec_helper'
describe 'ApiDocumentContent section tests' do
  it 'ApiDocumentContent | AddElement method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document_content/add_element.js')
    expect(docx.elements.first.nonempty_runs.first
               .alternate_content.office2010_content.graphic.type).to eq(:shape)
    expect(docx.elements.first.nonempty_runs.first
               .alternate_content.office2010_content.graphic
               .data.text_body.elements[1].nonempty_runs
               .first.text)
      .to eq('We removed all elements from the shape and added a new paragraph inside it.')
  end

  it 'ApiDocumentContent | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document_content/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = documentContent')
  end

  it 'ApiDocumentContent | GetElement method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document_content/get_element.js')
    expect(docx.notes.first.type).to eq('header1')
    expect(docx.notes.first.elements.first.nonempty_runs.first.text).to eq('This is the text in the default header')
  end

  it 'ApiDocumentContent | GetElementsCount method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document_content/get_elements_count.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Number of elements inside the shape: 1')
  end

  it 'ApiDocumentContent | Push method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document_content/push.js')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.text_body.elements[1]
        .nonempty_runs.first.text).to eq('We removed all elements from the shape and added a new paragraph inside it.')
  end

  it 'ApiDocumentContent | RemoveAllElements method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document_content/remove_all_elements.js')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.text_body.elements.size).to eq(2)
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.text_body.elements[1]
        .nonempty_runs.first.text).to eq('We removed all elements from the shape and added a new paragraph inside it.')
  end

  it 'ApiDocumentContent | RemoveElement method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document_content/remove_element.js')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.text_body.elements[1]
        .nonempty_runs.first.text).to eq('This is paragraph #2.')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.text_body.elements[2]
        .nonempty_runs.first.text).to eq('This is paragraph #4.')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.text_body.elements[3]
        .nonempty_runs.first.text).to eq('This is paragraph #5.')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.text_body.elements[4]
        .nonempty_runs.first.text).to eq('We removed paragraph #3, check that out above.')
  end

  it 'ApiDocumentContent | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document_content/to_json.js')
    expect(docx.elements[0].nonempty_runs.first.text).to eq('Simple text')
    json = JSON.parse(docx.elements[1].nonempty_runs.first.text)
    expect(json['type']).to eq('docContent')
  end
end

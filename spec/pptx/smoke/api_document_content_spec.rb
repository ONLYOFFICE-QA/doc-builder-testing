# frozen_string_literal: true

require 'spec_helper'
describe 'ApiDocumentContent section tests', :critical do
  it 'ApiDocumentContent | AddElement method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_document_content/add_element.js')
    expect(pptx.slides.first.elements.first
               .text_body.paragraphs.last.runs
               .first.text)
      .to eq('We removed all elements from ' \
             'the shape and added a new paragraph inside it.')
  end

  it 'ApiDocumentContent | GetClassType method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_document_content/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.last.characters.first.text).to eq('Class Type = documentContent')
  end

  it 'ApiDocumentContent | GetElement method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_document_content/get_element.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.size).to eq(2)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.numbering.type).to eq(:arabicParenR)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.numbering.start_at).to eq('1')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.characters.first.text).to eq(' This is an example of the numbered paragraph.')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.last.characters.first.text).to eq(' This is an example of the numbered paragraph.')
  end

  it 'ApiDocumentContent | GetElementsCount method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_document_content/get_elements_count.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.last.characters[1].text).to eq('Number of elements inside the shape: 1')
  end

  it 'ApiDocumentContent | Push method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_document_content/push.js')
    expect(pptx.slides.first.elements.first
               .text_body.paragraphs.last
               .characters.first.text)
      .to eq('We removed all elements from the ' \
             'shape and added a new paragraph inside it.')
  end

  it 'ApiDocumentContent | RemoveAllElements method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_document_content/remove_all_elements.js')
    paragraphs = pptx.slides.first.elements
                     .first.text_body.paragraphs
    expect(paragraphs.size).to eq(2)
    expect(paragraphs.last.characters.first.text)
      .to eq('We removed all elements from the ' \
             'shape and added a new paragraph inside it.')
  end

  it 'ApiDocumentContent | RemoveElement method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_document_content/remove_element.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.size).to eq(5)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.characters.first.text).to eq('This is paragraph #1.')
    expect(pptx.slides.first.elements.first.text_body.paragraphs[1].characters.first.text).to eq('This is paragraph #2.')
    expect(pptx.slides.first.elements.first.text_body.paragraphs[2].characters.first.text).to eq('This is paragraph #4.')
    expect(pptx.slides.first.elements.first.text_body.paragraphs[3].characters.first.text).to eq('This is paragraph #5.')
    expect(pptx.slides.first.elements.first.text_body.paragraphs[4].characters.first.text).to eq('We removed paragraph #3, check that out above.')
  end
end

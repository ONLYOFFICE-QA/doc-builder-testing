require 'spec_helper'
describe 'ApiDocumentContent section tests' do
  it 'ApiDocumentContent | AddElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocumentContent/addelement.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.type).to eq(:shape)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.text_body.elements[1].character_style_array.first.text).to eq('We removed all elements from the shape and added a new paragraph inside it.')
  end

  it 'ApiDocumentContent | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocumentContent/getclasstype.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Class Type = documentContent')
  end

  it 'ApiDocumentContent | GetElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocumentContent/getelement.js')
    expect(docx.notes.first.type).to eq('header1')
    expect(docx.notes.first.elements.first.character_style_array[1].text).to eq('This is the text in the default header')
  end

  it 'ApiDocumentContent | GetElementsCount method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocumentContent/getelementscount.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Number of elements inside the shape: 2')
  end

  it 'ApiDocumentContent | Push method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocumentContent/push.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.text_body.elements[1]
        .character_style_array.first.text).to eq('We removed all elements from the shape and added a new paragraph inside it.')
  end

  it 'ApiDocumentContent | RemoveAllElements method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocumentContent/removeallelements.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.text_body.elements.size).to eq(2)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.text_body.elements[1]
        .character_style_array.first.text).to eq('We removed all elements from the shape and added a new paragraph inside it.')
  end

  it 'ApiDocumentContent | RemoveElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocumentContent/removeelement.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.text_body.elements[1]
        .character_style_array.first.text).to eq('This is paragraph #1.')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.text_body.elements[2]
        .character_style_array.first.text).to eq('This is paragraph #2.')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.text_body.elements[3]
        .character_style_array.first.text).to eq('This is paragraph #4.')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.text_body.elements[4]
        .character_style_array.first.text).to eq('This is paragraph #5.')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.text_body.elements[5]
        .character_style_array.first.text).to eq('We removed paragraph #3, check that out above.')
  end
end

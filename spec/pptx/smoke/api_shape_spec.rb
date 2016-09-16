require 'spec_helper'
describe 'ApiShape section tests' do
  it 'ApiShape | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_shape/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq('Class Type = shape')
  end

  it 'ApiShape | GetDocContent method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_shape/get_doc_content.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.size).to eq(2)
    expect(pptx.slides.first.elements.first.text_body.paragraphs[1].runs.size).to eq(2)
    expect(pptx.slides.first.elements.first.text_body.paragraphs[1].runs.first.text).to eq('We removed all elements from the shape and added a new paragraph inside it ')
    expect(pptx.slides.first.elements.first.text_body.paragraphs[1].runs[1].text).to eq('aligning it vertically by the bottom.')
    expect(pptx.slides.first.elements.first.text_body.paragraphs[1].properties.align).to eq(:left)
  end

  it 'ApiShape | SetVerticalTextAlign method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_shape/set_vertical_text_align.js')
    expect(pptx.slides.first.elements.first.text_body.properties.vertical_align).to eq(:bottom)
  end
end

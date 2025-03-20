# frozen_string_literal: true

require 'spec_helper'
describe 'ApiSelection section tests' do
  before { skip 'new methods' if builder.semver < Semantic::Version.new('8.3.0') }

  it 'ApiSelection | GetShapes method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_selection/get_slides.js')
    expect(pptx.slides.first.common_slide_data.shape_tree.elements[1].text_body.paragraphs.first.runs.first.text).to eq('Slides length: 1, type: slide')
  end

  it 'ApiSelection | GetSlides method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_selection/get_shapes.js')
    expect(pptx.slides.first.common_slide_data.shape_tree.elements[1].text_body.paragraphs.first.runs.first.text).to eq('Shapes length: 1, type: image')
  end

  it 'ApiSelection | GetType method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_selection/get_type.js')
    expect(pptx.slides.first.common_slide_data.shape_tree.elements[1].text_body.paragraphs.first.runs.first.text).to eq('Selection type: shapes')
  end

  it 'ApiSelection | IsEmpty method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_selection/is_empty.js')
    # TODO: https://bugzilla.onlyoffice.com/show_bug.cgi?id=73280
    # expect(pptx.slides.first.common_slide_data.shape_tree.elements.first.text_body.paragraphs.first.runs[0].text).to eq('Selection is empty: true')
    expect(pptx.slides.first.common_slide_data.shape_tree.elements.first.text_body.paragraphs.first.runs[1].text).to eq('Selection is empty: false')
  end
end

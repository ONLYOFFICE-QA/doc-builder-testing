# frozen_string_literal: true

require 'spec_helper'
describe 'ApiDrawing section tests' do
  it 'ApiDrawing | GetClassType method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_drawing/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.last.characters.first.text).to eq('Class Type = shape')
  end

  it 'ApiDrawing | SetPosition method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_drawing/set_position.js')
    expect(pptx.slides.first.elements.first.shape_properties.shape_size.offset.x).to eq(OoxmlParser::OoxmlSize.new(608_400, :emu))
    expect(pptx.slides.first.elements.first.shape_properties.shape_size.offset.y).to eq(OoxmlParser::OoxmlSize.new(1_267_200, :emu))
  end

  it 'ApiDrawing | SetSize method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_drawing/set_size.js')
    expect(pptx.slides.first.elements.first.shape_properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(300 * 36_000, :emu))
    expect(pptx.slides.first.elements.first.shape_properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(130 * 36_000, :emu))
  end

  it 'ApiDrawing | Select method' do
    skip 'new methods' if builder.semver < Semantic::Version.new('8.3.0')
    pptx = builder.build_and_parse('js/pptx/smoke/api_drawing/select.js')
    expect(pptx.slides.first.common_slide_data.shape_tree.elements[1].text_body.paragraphs.first.runs.first.text).to eq('Selection: true')
  end
end

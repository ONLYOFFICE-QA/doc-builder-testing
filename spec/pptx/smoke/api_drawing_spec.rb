require 'spec_helper'
describe 'ApiDrawing section tests' do
  it 'ApiDrawing | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_drawing/get_class_type.js')
    expect(pptx.slides[0].elements.first.text_body.paragraphs.last.characters.first.text).to eq('Class Type = shape')
  end

  it 'ApiDrawing | SetPosition method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_drawing/set_position.js')
    expect(pptx.slides.first.elements.first.shape_properties.shape_size.offset.x).to eq(OoxmlParser::OoxmlSize.new(608400, :emu))
    expect(pptx.slides.first.elements.first.shape_properties.shape_size.offset.y).to eq(OoxmlParser::OoxmlSize.new(1267200, :emu))
  end

  it 'ApiDrawing | SetSize method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_drawing/set_size.js')
    expect(pptx.slides.first.elements.first.shape_properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(300 * 36000, :emu))
    expect(pptx.slides.first.elements.first.shape_properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(130 * 36000, :emu))
  end
end

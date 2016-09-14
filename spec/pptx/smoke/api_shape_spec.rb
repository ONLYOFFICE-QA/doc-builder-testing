require 'spec_helper'
describe 'ApiShape section tests' do
  it 'ApiShape | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiShape/getclasstype.js')
    expect(pptx.slides.first.elements.first.shape_properties.preset.name).to eq(:flowChartOnlineStorage)
    expect(pptx.slides[0].nonempty_elements.first.text_body.paragraphs
               .first.characters.first.text).to eq('Class Type = shape')
    expect(pptx.slides.first.elements.first.shape_properties.fill.type).to eq(:solid)
    shape_color = pptx.slides.first.elements.last.shape_properties.fill.value
    expect([shape_color.red, shape_color.green, shape_color.blue].to_s).to eq("[61, 74, 107]")
    shape_size = pptx.slides.first.elements.first.shape_properties.shape_size.offset
    expect([shape_size.x.to_s, shape_size.y.to_s]).to eq(["608400.0 emu", "1267200.0 emu"])
  end

  it 'ApiShape | GetDocContent method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiShape/getdoccontent.js')
    expect(pptx.slides.first.elements.first.shape_properties.preset.name).to eq(:flowChartOnlineStorage)
    expect(pptx.slides[0].elements.first.text_body.paragraphs
               .last.characters.first.text).to eq("We removed all elements from the shape and added a new paragraph inside it ")
    expect(pptx.slides[0].elements.first.text_body.paragraphs
               .last.characters.last.text).to eq("aligning it vertically by the bottom.")
    expect(pptx.slides[0].elements.last.text_body.paragraphs.last.properties.align).to eq(:left)
  end

  it 'ApiShape | SetVerticalTextAlign method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiShape/getdoccontent.js')
    expect(pptx.slides.first.elements.first.shape_properties.preset.name).to eq(:flowChartOnlineStorage)
    expect(pptx.slides[0].elements.first.text_body.properties.vertical_align).to eq(:bottom)
  end
end

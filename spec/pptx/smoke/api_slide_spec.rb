require 'spec_helper'
describe 'ApiSlide section tests' do
  it 'ApiSlide | AddObject method' do
    pptx = builder.build_doc_and_parse('asserts/js/pptx/smoke/api_slide/add_object.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.type).to eq(:bar_3d)
    expect(pptx.slides.first.elements.first.graphic_data.first.title.elements.first.runs.first.text).to eq('Financial Overview')
    expect(pptx.slides.first.elements.first.graphic_data.first.title.elements.first.runs.first.properties.font_size).to eq(13)

    expect(pptx.slides.first.elements.first.graphic_data.first.display_labels.show_category_name).to be false
    expect(pptx.slides.first.elements.first.graphic_data.first.display_labels.show_legend_key).to be false
    expect(pptx.slides.first.elements.first.graphic_data.first.display_labels.show_series_name).to be false
    expect(pptx.slides.first.elements.first.graphic_data.first.display_labels.show_values).to be true
    expect(pptx.slides.first.elements.first.graphic_data.first.legend.position).to eq(:bottom)

    expect(pptx.slides.first.elements.first.graphic_data.first.axises.first.title.elements.first.runs.first.text).to eq('Year')
    expect(pptx.slides.first.elements.first.graphic_data.first.axises.first.title.elements.first.runs.first.properties.font_size).to eq(11)
    expect(pptx.slides.first.elements.first.graphic_data.first.axises[1].title.elements.first.runs.first.text).to eq('USD In Hundred Thousands')
    expect(pptx.slides.first.elements.first.graphic_data.first.axises[1].title.elements.first.runs.first.properties.font_size).to eq(10)

    expect(pptx.slides.first.elements.first.graphic_data.first.shape_properties.shape_size.offset.x).to eq(OoxmlParser::OoxmlSize.new(608_400, :emu))
    expect(pptx.slides.first.elements.first.graphic_data.first.shape_properties.shape_size.offset.y).to eq(OoxmlParser::OoxmlSize.new(1_267_200, :emu))
    expect(pptx.slides.first.elements.first.graphic_data.first.shape_properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(300 * 36_000, :emu))
    expect(pptx.slides.first.elements.first.graphic_data.first.shape_properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(130 * 36_000, :emu))
    expect(pptx.slides.first.elements.first.graphic_data.first.alternate_content.office2007_content.style_number).to eq(24)
  end

  it 'ApiSlide | GetClassType method' do
    pptx = builder.build_doc_and_parse('asserts/js/pptx/smoke/api_slide/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq('Class Type = slide')
  end

  it 'ApiSlide | GetHeight method' do
    pptx = builder.build_doc_and_parse('asserts/js/pptx/smoke/api_slide/get_height.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq('The slide height = 190 mm')
  end

  it 'ApiSlide | GetWidth method' do
    pptx = builder.build_doc_and_parse('asserts/js/pptx/smoke/api_slide/get_width.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq('The slide width = 254 mm')
  end

  it 'ApiSlide | RemoveAllObjects method' do
    pptx = builder.build_doc_and_parse('asserts/js/pptx/smoke/api_slide/remove_all_objects.js')
    expect(pptx.slides.first.elements).to be_empty
  end

  it 'ApiSlide | SetBackground method' do
    pptx = builder.build_doc_and_parse('asserts/js/pptx/smoke/api_slide/set_background.js')
    expect(pptx.slides.first.background.fill).to be_truthy
  end
end

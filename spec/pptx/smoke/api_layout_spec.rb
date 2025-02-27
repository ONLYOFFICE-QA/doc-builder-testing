# frozen_string_literal: true

require 'spec_helper'
describe 'ApiLayout section tests' do
  it 'ApiLayout | AddObject method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/add_object.js')
    expect(pptx.slide_layouts.first.common_slide_data.shape_tree.elements.last.text_body.paragraphs.first.runs.first.text).to eq('Layouts before: 5, after: 6')
  end

  it 'ApiLayout | ClearBackground method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/clear_background.js')
    expect(pptx.slide_layouts.first.common_slide_data.background.fill.color).to eq(:none)
  end

  it 'ApiLayout | Copy method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/copy.js')
    expect(pptx.slide_layouts.size).to eq(12)
    expect(pptx.slide_layouts.first.common_slide_data.shape_tree.elements.last.text_body.paragraphs.first.runs.first.text).to eq('Layouts before: 11, after: 12')
  end

  it 'ApiLayout | Delete method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/delete.js')
    expect(pptx.slide_layouts.size).to eq(10)
    expect(pptx.slides.first.common_slide_data.shape_tree.elements.first.text_body.paragraphs.first.runs.first.text).to eq('Layouts before: 11, after: 10')
  end

  it 'ApiLayout | Duplicate method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/duplicate.js')
    expect(pptx.slide_layouts.size).to eq(12)
    expect(pptx.slides.first.common_slide_data.shape_tree.elements.first.text_body.paragraphs.first.runs.first.text).to eq('Layouts before: 11, after: 12')
  end

  it 'ApiLayout | FollowMasterBackground method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/follow_master_background.js')
    expect(pptx.slide_layouts.first.common_slide_data.background.fill.color).to eq(OoxmlParser::Color.new(255, 111, 61))
  end

  it 'ApiLayout | GetAllCharts method' do
    skip('https://bugzilla.onlyoffice.com/show_bug.cgi?id=73379') if builder.semver > Semantic::Version.new('8.3.0')
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/get_all_charts.js')
    expect(pptx.slide_layouts.first.common_slide_data.shape_tree.elements.last.class).to eq(OoxmlParser::GraphicFrame)
    expect(pptx.slides.first.common_slide_data.shape_tree.elements.first.text_body.paragraphs.first.runs.first.text).to eq('Charts count: 1, type: chart')
  end

  it 'ApiLayout | GetAllDrawings method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/get_all_drawings.js')
    expect(pptx.slide_layouts.first.common_slide_data.shape_tree.elements.size).to eq(2)
    expect(pptx.slide_layouts.first.common_slide_data.shape_tree.elements[0].class).to eq(OoxmlParser::DocxPicture)
    expect(pptx.slide_layouts.first.common_slide_data.shape_tree.elements[1].class).to eq(OoxmlParser::GraphicFrame)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs[0].text).to eq('Drawings count: 2')
    expect(slide_elements.first.text_body.paragraphs.first.runs[1].text).to eq('Types: image, oleObject')
  end

  it 'ApiLayout | GetAllImages method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/get_all_images.js')
    expect(pptx.slide_layouts.first.common_slide_data.shape_tree.elements[5].class).to eq(OoxmlParser::DocxPicture)
    expect(pptx.slides.first.common_slide_data.shape_tree.elements.first.text_body.paragraphs.first.runs.first.text).to eq('Images count: 1, type: image')
  end

  it 'ApiLayout | GetAllOleObjects method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/get_all_ole_objects.js')
    expect(pptx.slide_layouts.first.common_slide_data.shape_tree.elements.last.class).to eq(OoxmlParser::GraphicFrame)
    expect(pptx.slides.first.common_slide_data.shape_tree.elements.first.text_body.paragraphs.first.runs.first.text).to eq('OleObjects count: 1, type: oleObject')
  end

  it 'ApiLayout | GetAllShapes method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/get_all_shapes.js')
    expect(pptx.slide_layouts.first.common_slide_data.shape_tree.elements.size).to eq(6)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs[0].text).to eq('Shapes count: 5')
    expect(slide_elements.first.text_body.paragraphs.first.runs[1].text).to eq('Types: shape, shape, shape, shape, shape')
  end

  it 'ApiLayout | GetClassType method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/get_class_type.js')
    expect(pptx.slide_layouts.first.common_slide_data.shape_tree.elements.last.text_body.paragraphs.first.runs.first.text).to eq('GetClassType type: layout')
  end

  it 'ApiLayout | GetDrawingsByPlaceholderType method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/get_drawings_by_placeholder_type.js')
    expect(pptx.slide_layouts.first.common_slide_data.shape_tree.elements.last.text_body.paragraphs.first.runs.first.text).to eq('Drawings with placeholder subTitle count: 1')
  end

  it 'ApiLayout | GetMaster method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/get_master.js')
    expect(pptx.slide_layouts.first.common_slide_data.shape_tree.elements.last.text_body.paragraphs.first.runs.first.text).to eq('GetMaster type: master')
  end

  it 'ApiLayout | MoveTo method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/move_to.js')
    expect(pptx.slide_layouts.first.common_slide_data.shape_tree.elements.last.class).to eq(OoxmlParser::DocxPicture)
    expect(pptx.slides.first.common_slide_data.shape_tree.elements.first.text_body.paragraphs.first.runs.first.text).to eq('Layout(0) images: 1, Layout(3) images: 0')
  end

  it 'ApiLayout | RemoveObject method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/remove_object.js')
    expect(pptx.slides.first.common_slide_data.shape_tree.elements.first.text_body.paragraphs.first.runs.first.text).to eq('Layouts before: 5, after: 4')
  end

  it 'ApiLayout | SetBackground method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/set_background.js')
    background_color = pptx.slide_layouts.first.common_slide_data.background.fill.color
    expect(background_color.gradient_stops[0].color).to eq(OoxmlParser::Color.new(255, 213, 191))
    expect(background_color.gradient_stops[0].position).to eq(0)
    expect(background_color.gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 111, 61))
    expect(background_color.gradient_stops[1].position).to eq(100)
  end

  # TODO: no method to check, will be added in 8.3
  # it 'ApiLayout | SetName method' do
  #   pptx = builder.build_and_parse('js/pptx/smoke/api_layout/set_name.js')
  #   expect(pptx.slides.first.elements.last.text_body.paragraphs.last.characters.first.text).to eq('Class Type = image')
  # end

  it 'ApiLayout | ToJSON method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_layout/to_json.js')
    expect(pptx.slide_layouts.size).to eq(12)
    expect(pptx.slide_layouts.first.common_slide_data.shape_tree.elements.last.text_body.paragraphs.first.runs.first.text).to eq('sType: layout')
  end
end

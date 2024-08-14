# frozen_string_literal: true

require 'spec_helper'
describe 'ApiMaster section tests' do
  it 'ApiMaster | AddLayout method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/add_layout.js')
    # TODO: https://bugzilla.onlyoffice.com/show_bug.cgi?id=69619
    # expect(pptx.slide_masters.size).to eq(1)
    # expect(pptx.slide_layouts.size).to eq(1)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Layouts before: 0, after: 1')
  end

  it 'ApiMaster | AddObject method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/add_object.js')
    # TODO: https://bugzilla.onlyoffice.com/show_bug.cgi?id=69619
    # expect(pptx.slide_masters.size).to eq(1)
    shape_element = pptx.slide_masters[1].common_slide_data.shape_tree.elements.first
    expect(shape_element.class).to eq(OoxmlParser::DocxShape)
    expect(shape_element.text_body.paragraphs.first.runs.first.text).to eq('before: 0, after: 1')
  end

  it 'ApiMaster | ClearBackground method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/clear_background.js')
    expect(pptx.slide_masters.size).to eq(1)
    expect(pptx.slide_masters.first.common_slide_data.background.fill.color).to eq(:none)
  end

  it 'ApiMaster | Copy method' do
    skip('Fixed since v8.1.1') if builder.semver <= Semantic::Version.new('8.1.0')
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/copy.js')
    expect(pptx.slide_masters.size).to eq(2)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Masters before: 1, after: 2')
  end

  it 'ApiMaster | Delete method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/delete.js')
    # TODO: https://bugzilla.onlyoffice.com/show_bug.cgi?id=69619
    # заменить удаление второго мастера на первый
    expect(pptx.slide_masters.size).to eq(1)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Masters before: 2, after: 1')
  end

  it 'ApiMaster | Duplicate method' do
    skip('Fixed since v8.1.1') if builder.semver <= Semantic::Version.new('8.1.0')
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/duplicate.js')
    expect(pptx.slide_masters.size).to eq(2)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Masters before: 1, after: 2')
  end

  it 'ApiMaster | GetAllCharts method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_all_charts.js')
    # TODO: https://bugzilla.onlyoffice.com/show_bug.cgi?id=69619
    # expect(pptx.slide_masters.size).to eq(1)
    expect(pptx.slide_masters[1].common_slide_data.shape_tree.elements.first.class).to eq(OoxmlParser::GraphicFrame)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Charts count: 1, type: chart')
  end

  it 'ApiMaster | GetAllDrawings method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_all_drawings.js')
    # TODO: https://bugzilla.onlyoffice.com/show_bug.cgi?id=69619
    # expect(pptx.slide_masters.size).to eq(1)
    expect(pptx.slide_masters[1].common_slide_data.shape_tree.elements.size).to eq(2)
    expect(pptx.slide_masters[1].common_slide_data.shape_tree.elements[0].class).to eq(OoxmlParser::DocxPicture)
    expect(pptx.slide_masters[1].common_slide_data.shape_tree.elements[1].class).to eq(OoxmlParser::GraphicFrame)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs[0].text).to eq('Drawings count: 2')
    expect(slide_elements.first.text_body.paragraphs.first.runs[1].text).to eq('Types: drawing, drawing')
  end

  it 'ApiMaster | GetAllImages method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_all_images.js')
    # TODO: https://bugzilla.onlyoffice.com/show_bug.cgi?id=69619
    # expect(pptx.slide_masters.size).to eq(1)
    expect(pptx.slide_masters[1].common_slide_data.shape_tree.elements.first.class).to eq(OoxmlParser::DocxPicture)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Images count: 1, type: image')
  end

  it 'ApiMaster | GetAllOleObjects method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_all_ole_objects.js')
    # TODO: https://bugzilla.onlyoffice.com/show_bug.cgi?id=69619
    # expect(pptx.slide_masters.size).to eq(1)
    expect(pptx.slide_masters[1].common_slide_data.shape_tree.elements.first.class).to eq(OoxmlParser::GraphicFrame)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('OleObjects count: 1, type: oleObject')
  end

  it 'ApiMaster | GetAllShapes method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_all_shapes.js')
    # TODO: https://bugzilla.onlyoffice.com/show_bug.cgi?id=69619
    # expect(pptx.slide_masters.size).to eq(1)
    expect(pptx.slide_masters[1].common_slide_data.shape_tree.elements.first.class).to eq(OoxmlParser::DocxShape)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Shapes count: 1, type: shape')
  end

  it 'ApiMaster | GetClassType method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_class_type.js')
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('GetClassType type: master')
  end

  it 'ApiMaster | GetLayout method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_layout.js')
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('GetLayout layout type: layout')
  end

  it 'ApiMaster | GetLayoutsCount method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_layouts_count.js')
    expect(pptx.slide_layouts.size).to eq(11)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Layouts count: 11')
  end

  it 'ApiMaster | GetTheme method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_theme.js')
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('GetTheme type: theme')
  end

  it 'ApiMaster | RemoveLayout method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/remove_layout.js')
    expect(pptx.slide_layouts.size).to eq(4)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Layouts count before: 11 after: 4')
  end

  it 'ApiMaster | RemoveObject method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/remove_object.js')
    # TODO: https://bugzilla.onlyoffice.com/show_bug.cgi?id=69619
    # expect(pptx.slide_masters.size).to eq(1)
    expect(pptx.slide_masters[1].common_slide_data.shape_tree.elements.size).to eq(1)
    expect(pptx.slide_masters[1].common_slide_data.shape_tree.elements.first.class).to eq(OoxmlParser::DocxPicture)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs[0].text).to eq('Drawings count: 2')
    expect(slide_elements.first.text_body.paragraphs.first.runs[1].text).to eq('Drawings count: 1')
    expect(slide_elements.first.text_body.paragraphs.first.runs[2].text).to eq('Shapes: 0, images: 1')
  end

  it 'ApiMaster | SetBackground method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/set_background.js')
    expect(pptx.slide_masters.size).to eq(1)
    background_color = pptx.slide_masters.first.common_slide_data.background.fill.color
    expect(background_color.gradient_stops[0].color).to eq(OoxmlParser::Color.new(255, 213, 191))
    expect(background_color.gradient_stops[0].position).to eq(0)
    expect(background_color.gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 111, 61))
    expect(background_color.gradient_stops[1].position).to eq(100)
  end

  it 'ApiMaster | SetTheme method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/set_theme.js')
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs[0].text).to eq('SetTheme result: true')
    expect(slide_elements.first.text_body.paragraphs.first.runs[1].text).to include('Times New Roman')
  end

  it 'ApiMaster | ToJSON method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/to_json.js')
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs[0].text).to eq('sType: master')
  end
end

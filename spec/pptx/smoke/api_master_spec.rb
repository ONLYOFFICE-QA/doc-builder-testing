# frozen_string_literal: true

require 'spec_helper'
describe 'ApiMaster section tests' do
  it 'ApiMaster | AddLayout method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/add_layout.js')
    expect(pptx.slide_masters.size).to eq(1)
    expect(pptx.slide_layouts.size).to eq(1)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Layouts before: 0, after: 1')
  end

  # it 'ApiMaster | AddObject method' do
  #   pptx = builder.build_and_parse('js/pptx/smoke/api_master/add_object.js')
  #   expect('').to eq('')
  # end

  it 'ApiMaster | ClearBackground method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/clear_background.js')
    expect(pptx.slide_masters.size).to eq(1)
    expect(pptx.slide_masters.first.common_slide_data.background.fill.color).to eq(:none)
  end

  it 'ApiMaster | Copy method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/copy.js')
    expect(pptx.slide_masters.size).to eq(2)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Masters before: 1, after: 2')
  end

  it 'ApiMaster | Delete method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/delete.js')
    expect(pptx.slide_masters.size).to eq(1)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Masters before: 2, after: 1')
  end

  it 'ApiMaster | Duplicate method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/duplicate.js')
    expect(pptx.slide_masters.size).to eq(2)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Masters before: 1, after: 2')
  end

  # it 'ApiMaster | GetAllCharts method' do
  #   pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_all_charts.js')
  #   expect('').to eq('')
  # end

  # it 'ApiMaster | GetAllDrawings method' do
  #   pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_all_drawings.js')
  #   expect('').to eq('')
  # end

  # it 'ApiMaster | GetAllImages method' do
  #   pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_all_images.js')
  #   expect('').to eq('')
  # end

  # it 'ApiMaster | GetAllOleObjects method' do
  #   pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_all_ole_objects.js')
  #   expect('').to eq('')
  # end

  # it 'ApiMaster | GetAllShapes method' do
  #   pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_all_shapes.js')
  #   expect('').to eq('')
  # end

  it 'ApiMaster | GetClassType method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_class_type.js')
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Type: master')
  end

  # it 'ApiMaster | GetLayout method' do
  #   pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_layout.js')
  #   expect('').to eq('')
  # end

  it 'ApiMaster | GetLayoutsCount method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_layouts_count.js')
    expect(pptx.slide_layouts.size).to eq(2)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Layouts count: 2')
  end

  it 'ApiMaster | GetTheme method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/get_theme.js')
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Theme type: theme')
  end

  it 'ApiMaster | RemoveLayout method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/remove_layout.js')
    expect(pptx.slide_layouts.size).to eq(4)
    slide_elements = pptx.slides.first.common_slide_data.shape_tree.elements
    expect(slide_elements.first.text_body.paragraphs.first.runs.first.text).to eq('Layouts count before: 11 after: 4')
  end

  # it 'ApiMaster | RemoveObject method' do
  #   pptx = builder.build_and_parse('js/pptx/smoke/api_master/remove_object.js')
  #   expect('').to eq('')
  # end

  it 'ApiMaster | SetBackground method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_master/set_background.js')
    expect(pptx.slide_masters.size).to eq(1)
    background_color = pptx.slide_masters.first.common_slide_data.background.fill.color
    expect(background_color.gradient_stops[0].color).to eq(OoxmlParser::Color.new(255, 213, 191))
    expect(background_color.gradient_stops[0].position).to eq(0)
    expect(background_color.gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 111, 61))
    expect(background_color.gradient_stops[1].position).to eq(100)
  end

  # it 'ApiMaster | SetTheme method' do
  #   expect('').to eq('')
  # end

  # it 'ApiMaster | ToJSON method' do
  #   expect('').to eq('')
  # end
end

require 'spec_helper'
describe 'Api section tests' do
  it 'Api | CreateBlipFill method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_blip_fill.js')
    expect(pptx.slides.first.elements.first.non_visual_properties.non_visual_properties.placeholder.type).to eq(:ctrTitle)
    expect(pptx.slides.first.elements.first.non_visual_properties.common_properties.name.to_s).to eq("Title 1")
  end

  it 'Api | CreateBullet method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_bullet.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreateChart method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_chart.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.type).to eq(:bar_3d)
    pptx.slides.first.elements.first.graphic_data.first.series.each do |series|
      expect(series.categories.string.cache.points.map { |current_point| current_point.text.value }).to eq(%w(2014 2015 2016))
    end
    expect(pptx.slides.first.elements.first.graphic_data.first.data.first.points
               .map { |current_point| current_point.value.to_s }).to eq(%w(200.0 240.0 280.0))
    expect(pptx.slides.first.elements.first.graphic_data.first.data.first.points
               .map { |current_point| current_point.value.to_s }).to eq(%w(200.0 240.0 280.0))
    expect(pptx.slides.first.elements.first.graphic_data.first.series.first.text.string.cache.points.first.text.value).to eq('Projected Revenue')
    expect(pptx.slides.first.elements.first.graphic_data.first.series.last.text.string.cache.points.first.text.value).to eq('Estimated Costs')
    expect(pptx.slides.first.elements.first.graphic_data.first.title.nil?).to be_truthy
    expect(pptx.slides.first.elements.first.graphic_data.first.alternate_content.office2007_content.style_number).to eq(24)
    expect(pptx.slides.first.elements.first.properties).to eq('Estimated Costs')
  end

  it 'Api | CreateGradientStop method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_gradient_stop.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreateImage method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_image.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreateLinearGradientFill method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_linear_gradient_fill.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreateNoFill method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_no_fill.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreateNumbering method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_numbering.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreateParagraph method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_paragraph.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreatePatternFill method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_pattern_fill.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreatePresetColor method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_preset_color.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreateRadialGradientFill method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_radial_gradient_fill.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreateRgbColor method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_rgb_color.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreateRun method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_run.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreateSchemeColor method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_scheme_color.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreateShape method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_shape.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreateSlide method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_slide.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreateSolidFill method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_solid_fill.js')
    expect(pptx).to be_with_data
  end

  it 'Api | CreateStroke method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/create_stroke.js')
    expect(pptx).to be_with_data
  end

  it 'Api | GetPresentation method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api/get_presentation.js')
    expect(pptx).to be_with_data
  end
end

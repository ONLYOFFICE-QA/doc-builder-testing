# frozen_string_literal: true

require 'spec_helper'
describe 'Api section tests' do
  it 'Api | CreateBlipFill method' do
    pending('https://github.com/ONLYOFFICE/DocumentBuilder/issues/26') if Gem.win_platform?
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_blip_fill.js')
    expect(pptx.slides.first.background.fill.image.file_reference.content.length).to be >= 1_000
    expect(pptx.slides.first.background.fill.image.tile).to be_a_kind_of(OoxmlParser::Tile)
  end

  it 'Api | CreateBullet method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_bullet.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.numbering.symbol).to eq('-')
  end

  it 'Api | CreateChart method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_chart.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.type).to eq(:bar_3d)
    points = pptx.slides.first.elements.first.graphic_data.first.series[0]
                 .values.number_reference.cache.points
    %w[200 240 280].each_with_index do |value, index|
      expect(points[index].value.value).to eq(value)
    end
    points2 = pptx.slides.first.elements.first.graphic_data.first.series[1]
                  .values.number_reference.cache.points
    %w[250 260 280].each_with_index do |value, index|
      expect(points2[index].value.value).to eq(value)
    end
    expect(pptx.slides.first.elements.first.graphic_data.first.series.first.text.string.cache.points.first.value.value).to eq('Projected Revenue')
    expect(pptx.slides.first.elements.first.graphic_data.first.series.last.text.string.cache.points.first.value.value).to eq('Estimated Costs')
    %w[2014 2015 2016].each_with_index do |value, index|
      expect(pptx.slides.first.elements.first.graphic_data.first.series.first.categories.string.cache.points[index].value.value).to eq(value)
      expect(pptx.slides.first.elements.first.graphic_data.first.series[1].categories.string.cache.points[index].value.value).to eq(value)
    end
    expect(pptx.slides.first.elements.first.graphic_data.first.shape_properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(300 * 36_000, :emu))
    expect(pptx.slides.first.elements.first.graphic_data.first.shape_properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(130 * 36_000, :emu))
    expect(pptx.slides.first.elements.first.graphic_data.first.alternate_content.office2007_content.style_number).to eq(24)
  end

  it 'Api | CreateGradientStop method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_gradient_stop.js')
    expect(pptx.slides.first.background.fill.color.gradient_stops.first.color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(pptx.slides.first.background.fill.color.gradient_stops.first.position).to eq(0)
    expect(pptx.slides.first.background.fill.color.gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 164, 101))
    expect(pptx.slides.first.background.fill.color.gradient_stops[1].position).to eq(100_000 / 1_000)
  end

  it 'Api | CreateImage method' do
    pending('https://github.com/ONLYOFFICE/DocumentBuilder/issues/26') if Gem.win_platform?
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_image.js')
    expect(pptx.slides.first.elements.first.path_to_image.file_reference.content.length).to be >= 1_000
    expect(pptx.slides.first.elements.first.properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(300 * 36_000, :emu))
    expect(pptx.slides.first.elements.first.properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(150 * 36_000, :emu))
  end

  it 'Api | CreateLinearGradientFill method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_linear_gradient_fill.js')
    expect(pptx.slides.first.background.fill.color.linear_gradient.angle).to eq(5_400_000 / 100_000.0)
  end

  it 'Api | CreateNoFill method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_no_fill.js')
    expect(pptx.slides.first.elements.first.shape_properties.line).to be_invisible
  end

  it 'Api | CreateNumbering method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_numbering.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.numbering.type).to eq(:arabicParenR)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.numbering.start_at).to eq('1')
  end

  it 'Api | CreateParagraph method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_paragraph.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.size).to eq(2)
  end

  it 'Api | CreatePatternFill method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_pattern_fill.js')
    expect(pptx.slides.first.background.fill.type).to eq(:pattern)
    expect(pptx.slides.first.background.fill.pattern.preset).to eq(:dashDnDiag)
    expect(pptx.slides.first.background.fill.pattern.background_color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(pptx.slides.first.background.fill.pattern.foreground_color).to eq(OoxmlParser::Color.new(255, 164, 101))
  end

  it 'Api | CreatePresetColor method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_preset_color.js')
    expect(pptx.slides.first.background.fill.color.gradient_stops.first.color.value).to eq('lightYellow')
    expect(pptx.slides.first.background.fill.color.gradient_stops.first.position).to eq(0)
  end

  it 'Api | CreateRadialGradientFill method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_radial_gradient_fill.js')
    expect(pptx.slides.first.background.fill.color.gradient_stops.first.color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(pptx.slides.first.background.fill.color.gradient_stops.first.position).to eq(0)
    expect(pptx.slides.first.background.fill.color.gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 164, 101))
    expect(pptx.slides.first.background.fill.color.gradient_stops[1].position).to eq(100_000 / 1_000)
  end

  it 'Api | CreateRgbColor method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_rgb_color.js')
    expect(pptx.slides.first.background.fill.color.gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 164, 101))
    expect(pptx.slides.first.background.fill.color.gradient_stops[1].position).to eq(100_000 / 1_000)
  end

  it 'Api | CreateRun method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_run.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.size).to eq(2)
  end

  it 'Api | CreateSchemeColor method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_scheme_color.js')
    expect(pptx.slides.first.background.fill.color.gradient_stops.first.color.converted_color.scheme).to eq('accent6')
  end

  it 'Api | CreateShape method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_shape.js')
    expect(pptx.slides.first.elements.first.shape_properties.preset_geometry.name).to eq(:flowChartMagneticTape)
    expect(pptx.slides.first.elements.first.shape_properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(300 * 36_000, :emu))
    expect(pptx.slides.first.elements.first.shape_properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(130 * 36_000, :emu))
    expect(pptx.slides.first.elements.first.shape_properties.fill_color.value).to eq(OoxmlParser::Color.new(61, 74, 107))
    expect(pptx.slides.first.elements.first.shape_properties.line).to be_invisible
  end

  it 'Api | CreateSlide method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_slide.js')
    expect(pptx.slides.size).to eq(2)
  end

  it 'Api | CreateSolidFill method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_solid_fill.js')
    expect(pptx.slides.first.background.fill.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(pptx.slides.first.background.fill.type).to eq(:solid)
  end

  it 'Api | CreateStroke method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_stroke.js')
    expect(pptx.slides.first.elements.first.shape_properties.line).to be_invisible
  end

  it 'Api | GetPresentation method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/get_presentation.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.title.elements.first.runs.first.text).to eq('Financial Overview')
  end

  it 'Api | CreateTable method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api/create_table.js')
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.count).to eq(2)
    expect(pptx.slides.first.elements.last.graphic_data.first.rows.first.cells.count).to eq(2)
  end
end

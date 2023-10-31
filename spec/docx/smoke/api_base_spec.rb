# frozen_string_literal: true

require 'spec_helper'
describe 'Api section tests', :critical do
  it 'Api | CreateBlipFill method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_blip_fill.js')
    graphic = docx.elements.first.nonempty_runs
                  .first.alternate_content
                  .office2010_content.graphic
    properties = graphic.data.properties
    expect(graphic.type).to eq(:shape)
    expect(properties.preset_geometry.name).to eq(:star10)
    expect(properties.fill_color.type).to eq(:picture)
    expect(properties.fill_color.value).not_to be_nil
    expect(properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(5_930_900, :emu))
    expect(properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(595_605, :emu))
  end

  it 'Api | CreateChart method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_chart.js')
    expect(docx.elements.first.nonempty_runs.first.drawing.graphic.type).to eq(:chart)
    expect(docx.elements.first.nonempty_runs.first.drawing.graphic.data.type).to eq(:bar_3d)
    docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.series.each do |series|
      expect(series.categories.string.cache.points.map { |current_point| current_point.value.value }).to eq(%w[2014 2015 2016])
    end
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.series.first.text.string.cache.points.first.value.value).to eq('Projected Revenue')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.series.last.text.string.cache.points.first.value.value).to eq('Estimated Costs')
    expect(docx.elements.first.nonempty_runs.first.drawing.graphic.data.title).to be_nil
    expect(docx.elements.first.nonempty_runs.first.drawing.properties.object_size.x).to eq(OoxmlParser::OoxmlSize.new(4_051_299, :emu))
    expect(docx.elements.first.nonempty_runs.first.drawing.graphic.data.alternate_content.office2010_content.style_number).to eq(124)
  end

  it 'Api | CreateGradientStop method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_gradient_stop.js')
    graphic = docx.elements.first.nonempty_runs
                  .first.alternate_content
                  .office2010_content.graphic
    color = graphic.data.properties.fill_color
    expect(graphic.type).to eq(:shape)
    expect(color.type).to eq(:gradient)
    expect(color.value.gradient_stops[0].color.to_s).to eq('RGB (255, 224, 204)')
    expect(color.value.gradient_stops[0].position).to eq(0.0)
    expect(color.value.gradient_stops[1].color.to_s).to eq('RGB (255, 164, 101)')
    expect(color.value.gradient_stops[1].position).to eq(100.0)
  end

  it 'Api | CreateImage method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_image.js')
    drawing = docx.elements.first.nonempty_runs.first.drawing
    drawing ||= docx.elements.first.nonempty_runs.first.alternate_content.office2010_content
    expect(drawing.graphic.type).to eq(:picture)
    expect(drawing.graphic.data.path_to_image.file_reference.content.length).to be > 1000
    expect(drawing.properties.object_size.x).to eq(OoxmlParser::OoxmlSize.new(2_160_000, :emu))
    expect(drawing.properties.object_size.y).to eq(OoxmlParser::OoxmlSize.new(1_260_000, :emu))
  end

  it 'Api | CreateLinearGradientFill method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_linear_gradient_fill.js')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.properties.fill_color.value.linear_gradient.angle).to eq(54.0)
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.properties.fill_color.value.gradient_stops).not_to be_empty
  end

  it 'Api | CreateNoFill method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_no_fill.js')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2007_content.data.properties.stroke_color).to be_nil
  end

  it 'Api | CreateParagraph method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_paragraph.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('This is a new paragraph')
  end

  it 'Api | CreatePatternFill method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_pattern_fill.js')
    expect(docx.nil?).to be(false)
  end

  it 'Api | CreatePresetColor method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_preset_color.js')
    fill_color = docx.elements.first.nonempty_runs
                     .first.alternate_content
                     .office2010_content.graphic
                     .data.properties.fill_color
    gradient_stops = fill_color.value.gradient_stops
    expect(fill_color.type).to eq(:gradient)
    expect(gradient_stops[0].color.value).to eq('lightYellow')
    expect(gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 164, 101))
  end

  it 'Api | CreateRadialGradientFill method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_radial_gradient_fill.js')
    color_value = docx.elements.first.nonempty_runs
                      .first.alternate_content
                      .office2010_content.graphic
                      .data.properties.fill_color
                      .value
    expect(color_value.path).to eq(:circle)
    expect(color_value.gradient_stops[0].color.to_s).to eq('RGB (255, 224, 204)')
    expect(color_value.gradient_stops[0].position).to eq(0.0)
    expect(color_value.gradient_stops[1].color.to_s).to eq('RGB (255, 164, 101)')
    expect(color_value.gradient_stops[1].position).to eq(100.0)
  end

  it 'Api | CreateRGBColor method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_rgb_color.js')
    color_value = docx.elements.first.nonempty_runs
                      .first.alternate_content
                      .office2010_content.graphic
                      .data.properties.fill_color
                      .value
    expect(color_value.gradient_stops[0].color.to_s).to eq('RGB (255, 224, 204)')
    expect(color_value.gradient_stops[0].position).to eq(0.0)
    expect(color_value.gradient_stops[1].color.to_s).to eq('RGB (255, 164, 101)')
    expect(color_value.gradient_stops[1].position).to eq(100.0)
    expect(color_value).not_to be_nil
  end

  it 'Api | CreateRun method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_run.js')
    expect(docx.elements.first.nonempty_runs.size).to eq(1)
  end

  it 'Api | CreateSchemeColor method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_scheme_color.js')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.properties.fill_color.value.scheme).to eq('accent6')
  end

  it 'Api | CreateShape method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_shape.js')
    alternate_content = docx.elements.first.nonempty_runs.first.alternate_content
    expect(alternate_content.office2007_content.data.properties.stroke_color).to be_nil
    properties = alternate_content.office2010_content
                                  .graphic
                                  .data.properties
    expect(properties.preset_geometry.name).to eq(:rect)
    expect(properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(5_930_900, :emu))
    expect(properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(395_605, :emu))
    expect(properties.fill_color.value).not_to be_nil
  end

  it 'Api | CreateSolidFill method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_solid_fill.js')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.properties.fill_color.value).to eq(OoxmlParser::Color.new(0, 255, 0))
  end

  it 'Api | CreateStroke method' do
    docx = builder.build_and_parse('js/docx/smoke/api/create_stroke.js')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2007_content.data.properties.stroke_color).to eq(OoxmlParser::Color.new(255, 224, 204))
  end

  it 'Api | CreateTable method' do
    skip('https://github.com/ONLYOFFICE/ooxml_parser/issues/1188') if builder.semver == Semantic::Version.new('99.99.99')
    docx = builder.build_and_parse('js/docx/smoke/api/create_table.js')
    expect(docx.elements[1].rows.size).to eq(3)
    expect(docx.elements[1].rows[0].cells.size).to eq(3)
    expect(docx.elements[1].rows[1].cells.size).to eq(3)
    expect(docx.elements[1].rows[2].cells.size).to eq(3)
    expect(docx.elements[1].properties.table_borders.bottom.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_borders.left.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_borders.right.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_borders.top.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_borders.inside_horizontal.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements[1].properties.table_borders.inside_vertical.color).to eq(OoxmlParser::Color.new(255, 0, 0))
  end

  it 'Api | GetDocument method' do
    docx = builder.build_and_parse('js/docx/smoke/api/get_document.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('This is a new paragraph')
  end
end

require 'spec_helper'
describe 'Api section tests' do
  before :all do
    OoxmlParser.configure do |config|
      config.units = :emu
    end
  end
  it 'Api | CreateBlipFill method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createblipfill.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.type).to eq(:shape)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.preset_geometry.name).to eq(:star10)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.type).to eq(:picture)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.nil?).to be_falsey
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.shape_size.extent.x).to eq(5_930_900.0)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.shape_size.extent.y).to eq(595_605.0)
  end

  it 'Api | CreateChart method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createchart.js')
    expect(docx.elements.first.character_style_array[1].drawing.graphic.type).to eq(:chart)
    expect(docx.elements.first.character_style_array[1].drawing.graphic.data.type).to eq(:bar_3d)
    docx.elements.first.character_style_array[1].drawings.first.graphic.data.series.each do |series|
      expect(series.categories.string.cache.points.map { |current_point| current_point.text.value }).to eq(%w(2014 2015 2016))
    end
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.series.first.text.string.cache.points.first.text.value).to eq('Projected Revenue')
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.series.last.text.string.cache.points.first.text.value).to eq('Estimated Costs')
    expect(docx.elements.first.character_style_array[1].drawing.graphic.data.title.nil?).to be_truthy
    expect(docx.elements.first.character_style_array[1].drawing.properties.object_size.x).to eq(4_051_299.0)
    expect(docx.elements.first.character_style_array[1].drawing.graphic.data.alternate_content.office2010_content.style_number).to eq(102)
  end

  it 'Api | CreateGradientStop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/creategradientstop.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.type).to eq(:shape)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.type).to eq(:gradient)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.gradient_stops[0].color.to_s).to eq('RGB (255, 224, 204)')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.gradient_stops[0].position).to eq(0.0)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.gradient_stops[1].color.to_s).to eq('RGB (255, 164, 101)')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.gradient_stops[1].position).to eq(100.0)
  end

  it 'Api | CreateImage method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createimage.js')
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.type).to eq(:picture)
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.path_to_image.file_reference.content.length).to be > 1000
    expect(docx.elements.first.character_style_array[1].drawings.first.properties.object_size.x).to eq(2_160_000.0)
    expect(docx.elements.first.character_style_array[1].drawings.first.properties.object_size.y).to eq(1_260_000.0)
  end

  it 'Api | CreateLinearGradientFill method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createlineargradientfill.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.linear_gradient.angle).to eq(54.0)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.gradient_stops.empty?).to be_falsey
  end

  it 'Api | CreateNoFill method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createnofill.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2007_content.data.properties.stroke_color.nil?).to be_truthy
  end

  it 'Api | CreateParagraph method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createparagraph.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('This is a new paragraph')
  end

  it 'Api | CreatePatternFill method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createpatternfill.js')
    expect(docx.nil?).to eq(false)
  end

  it 'Api | CreatePresetColor method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createpresetcolor.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.preset).to eq(:dashDnDiag)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.background_color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.foreground_color).to eq(OoxmlParser::Color.new(255, 164, 101))
  end

  it 'Api | CreateRadialGradientFill method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createradialgradientfill.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.path).to eq(:circle)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.gradient_stops[0].color.to_s).to eq('RGB (255, 224, 204)')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.gradient_stops[0].position).to eq(0.0)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.gradient_stops[1].color.to_s).to eq('RGB (255, 164, 101)')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.gradient_stops[1].position).to eq(100.0)
  end

  it 'Api | CreateRGBColor method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/creatergbcolor.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.gradient_stops[0].color.to_s).to eq('RGB (255, 224, 204)')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.gradient_stops[0].position).to eq(0.0)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.gradient_stops[1].color.to_s).to eq('RGB (255, 164, 101)')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.gradient_stops[1].position).to eq(100.0)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.nil?).to be_falsey
  end

  it 'Api | CreateRun method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createrun.js')
    expect(docx.elements.first.character_style_array.size).to eq(3)
  end

  it 'Api | CreateSchemeColor method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createschemecolor.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.scheme).to eq('accent6')
  end

  it 'Api | CreateShape method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createshape.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.preset_geometry.name).to eq(:rect)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.shape_size.extent.x).to eq(5_930_900.0)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.shape_size.extent.y).to eq(395_605.0)
    expect(docx.elements.first.character_style_array[1].alternate_content.office2007_content.data.properties.stroke_color.nil?).to be_truthy
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.nil?).to be_falsey
  end

  it 'Api | CreateSolidFill method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createsolidfill.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value).to eq(OoxmlParser::Color.new(0, 255, 0))
  end

  it 'Api | CreateStroke method' do
    pending 'Documentation error'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createstroke.js')
    expect(docx.elements.first.character_style_array[1].alternate_content.office2007_content.data.properties.stroke_color).to eq(OoxmlParser::Color.new(255, 224, 204))
  end

  it 'Api | CreateTable method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createtable.js')
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
end

require 'spec_helper'
describe 'Api section tests' do
  it 'Api | CreateBlipFill method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_blip_fill.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.stretching_type).to eq(:tile)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.type).to eq(:picture)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.file_reference.content.length).to be >= 1_000
  end

  it 'Api | CreateBullet method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_bullet.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.numbering.symbol).to eq('-')
  end

  it 'Api | CreateGradientStop method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_gradient_stop.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.type).to eq(:gradient)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops.first.color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops.first.position).to eq(0)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 164, 101))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops[1].position).to eq(100_000 / 1_000)
  end

  it 'Api | CreateLinearGradientFill method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_linear_gradient_fill.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.type).to eq(:gradient)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops).not_to be_empty
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.linear_gradient.angle).to eq(5_400_000 / 100_000.0)
  end

  it 'Api | CreateNoFill method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_no_fill.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.line).to be_invisible
  end

  it 'Api | CreateNumbering method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_numbering.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.numbering.start_at).to eq('1')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.numbering.type).to eq(:arabicParenR)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[1].properties.numbering.start_at).to eq('1')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[1].properties.numbering.type).to eq(:arabicParenR)
  end

  it 'Api | CreateParagraph method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_paragraph.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs).to be_empty
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[1].runs.first.text).to eq('We removed all elements from the shape and added a new paragraph inside it.')
  end

  it 'Api | CreatePatternFill method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_pattern_fill.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.type).to eq(:pattern)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.background_color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.foreground_color).to eq(OoxmlParser::Color.new(255, 164, 101))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.preset).to eq(:dashDnDiag)
  end

  it 'Api | CreatePresetColor method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_preset_color.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops.first.color.value).to eq('lightYellow')
  end

  it 'Api | CreateRadialGradientFill method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_radial_gradient_fill.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.path).to eq(:circle)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops.first.color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops.first.position).to eq(0)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 164, 101))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops[1].position).to eq(100_000 / 1_000)
  end

  it 'Api | CreateRgbColor method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_rgb_color.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops.first.color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 164, 101))
  end

  it 'Api | CreateRun method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_run.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.first.text).to eq('This is just a sample text. ')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.first.properties.font_name).to eq('Arial')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].text).to eq("This is a text run with the font family set to 'Comic Sans MS'.")
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].properties.font_name).to eq('Comic Sans MS')
  end

  it 'Api | CreateSchemeColor method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_scheme_color.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops.first.color.converted_color.scheme).to eq('accent6')
  end

  it 'Api | CreateSolidFill method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_solid_fill.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.type).to eq(:solid)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value).to eq(OoxmlParser::Color.new(0, 255, 0))
  end

  it 'Api | CreateStroke method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_stroke.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.line.color_scheme.color).to eq(OoxmlParser::Color.new(255, 255, 0))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.line.width).to eq(OoxmlParser::OoxmlSize.new(3 * 36_000, :emu))
  end

  it 'Api | GetActiveSheet method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/get_active_sheet.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[1].cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[2].cells[0].text).to eq('2x2=')
    expect(xlsx.worksheets.first.rows[2].cells[1].text).to eq('4')
  end

  it 'Api | CreateColorByName method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_color_by_name.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].text).to eq('Text with color')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.color).to eq(OoxmlParser::Color.new(176, 196, 222))
  end

  it 'Api | CreateColorFromRGB method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/create_color_from_rgb.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].text).to eq('Text with color')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.color).to eq(OoxmlParser::Color.new(49, 133, 154))
  end

  it 'Api | GetThemesColors method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/get_themes_colors.js')
    %w[Office Grayscale Apex Aspect Civic Concourse Equity Flow
       Foundry Median Metro Module Opulent Oriel Origin Paper Solstice
       Technic Trek Urban Verve].each_with_index do |current_color, index|
      expect(xlsx.worksheets.first.rows[index].cells[0].text).to eq(current_color)
    end
  end

  it 'Api |  SetThemeColors method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/set_theme_colors.js')
    expect(xlsx.theme.color_scheme[:text2].color).to eq(OoxmlParser::Color.new(50, 50, 50))
  end

  it 'Api |  GetSheets method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/get_sheets.js')
    expect(xlsx.worksheets[0].rows[0].cells.first.text).to eq('Sheet1')
    expect(xlsx.worksheets[0].rows[1].cells.first.text).to eq('new_sheet_name')
  end

  it 'Api | Format method' do
    pending 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=37831'
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api/format_property.js')
    expect(xlsx.worksheets[0].rows[0].cells.first.text).to eq("|05:04:23 PM |")
  end
end

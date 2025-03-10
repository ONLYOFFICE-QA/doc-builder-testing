# frozen_string_literal: true

require 'spec_helper'
describe 'Api section tests' do
  it 'Api | CreateBlipFill method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_blip_fill.js')
    fill_color = xlsx.worksheets.first.drawings
                     .first.shape.properties
                     .fill_color
    expect(fill_color.stretching_type).to eq(:tile)
    expect(fill_color.type).to eq(:picture)
    expect(fill_color.value.file_reference.content.length).to be >= 1_000
  end

  it 'Api | CreateBullet method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_bullet.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.numbering.symbol).to eq('-')
  end

  it 'Api | CreateGradientStop method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_gradient_stop.js')
    fill_color = xlsx.worksheets.first.drawings.first.shape.properties.fill_color
    gradient_stops = fill_color.value.gradient_stops
    expect(fill_color.type).to eq(:gradient)
    expect(gradient_stops[0].color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(gradient_stops[0].position).to eq(0)
    expect(gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 164, 101))
    expect(gradient_stops[1].position).to eq(100_000 / 1_000)
  end

  it 'Api | CreateLinearGradientFill method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_linear_gradient_fill.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.type).to eq(:gradient)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops).not_to be_empty
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.linear_gradient.angle).to eq(5_400_000 / 100_000.0)
  end

  it 'Api | CreateNoFill method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_no_fill.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.line).to be_invisible
  end

  it 'Api | CreateNumbering method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_numbering.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.numbering.start_at).to eq('1')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.numbering.type).to eq(:arabicParenR)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[1].properties.numbering.start_at).to eq('1')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[1].properties.numbering.type).to eq(:arabicParenR)
  end

  it 'Api | CreateParagraph method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_paragraph.js')
    paragraphs = xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs
    expect(paragraphs[0].runs).to be_empty
    expect(paragraphs[1].runs.first.text).to eq('We removed all elements from the shape ' \
                                                'and added a new paragraph inside it.')
  end

  it 'Api | CreatePatternFill method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_pattern_fill.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.type).to eq(:pattern)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.background_color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.foreground_color).to eq(OoxmlParser::Color.new(255, 164, 101))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.preset).to eq(:dashDnDiag)
  end

  it 'Api | CreatePresetColor method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_preset_color.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops.first.color.value).to eq('lightYellow')
  end

  it 'Api | CreateRadialGradientFill method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_radial_gradient_fill.js')
    fill_color = xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value
    expect(fill_color.path).to eq(:circle)
    expect(fill_color.gradient_stops.first.color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(fill_color.gradient_stops.first.position).to eq(0)
    expect(fill_color.gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 164, 101))
    expect(fill_color.gradient_stops[1].position).to eq(100_000 / 1_000)
  end

  it 'Api | CreateRgbColor method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_rgb_color.js')
    gradient_stops = xlsx.worksheets.first.drawings.first.shape
                         .properties.fill_color.value.gradient_stops
    expect(gradient_stops[0].color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 164, 101))
  end

  it 'Api | CreateRun method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_run.js')
    runs = xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs
    expect(runs[0].text).to eq('This is just a sample text. ')
    expect(runs[0].properties.font_name).to eq('Arial')
    expect(runs[1].text).to eq("This is a text run with the font family set to 'Comic Sans MS'.")
    expect(runs[1].properties.font_name).to eq('Comic Sans MS')
  end

  it 'Api | CreateSchemeColor method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_scheme_color.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops.first.color.converted_color.scheme).to eq('accent6')
  end

  it 'Api | CreateSolidFill method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_solid_fill.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.type).to eq(:solid)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value).to eq(OoxmlParser::Color.new(0, 255, 0))
  end

  it 'Api | CreateStroke method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_stroke.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.line.color_scheme.color).to eq(OoxmlParser::Color.new(255, 255, 0))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.line.width).to eq(OoxmlParser::OoxmlSize.new(3 * 36_000, :emu))
  end

  it 'Api | GetActiveSheet method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/get_active_sheet.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[1].cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[2].cells[0].text).to eq('2x2=')
    expect(xlsx.worksheets.first.rows[2].cells[1].text).to eq('4')
  end

  it 'Api | CreateColorByName method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_color_by_name.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].text).to eq('Text with color')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.color).to eq(OoxmlParser::Color.new(176, 196, 222))
  end

  it 'Api | CreateColorFromRGB method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/create_color_from_rgb.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].text).to eq('Text with color')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.color).to eq(OoxmlParser::Color.new(49, 133, 154))
  end

  it 'Api | GetThemesColors method' do
    # TODO: 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=68709'
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/get_themes_colors.js')
    TestData.worksheet_themes_color.each_with_index do |current_color, index|
      expect(xlsx.worksheets.first.rows[index].cells[0].text).to eq(current_color)
    end
  end

  it 'Api | SetThemeColors method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/set_theme_colors.js')
    expect(xlsx.theme.color_scheme[:text2].color).to eq(OoxmlParser::Color.new(36, 40, 82))
  end

  it 'Api | GetSheets method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/get_sheets.js')
    expect(xlsx.worksheets[1].rows[0].cells.first.text).to eq('Sheet1')
    expect(xlsx.worksheets[1].rows[1].cells.first.text).to eq('new_sheet_name')
  end

  it 'Api | Format method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/format_property.js')
    expect(xlsx.worksheets[0].rows[0].cells.first.text).to eq('|05:04:23 PM|')
  end

  it 'Api | GetAllComments method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/get_all_comments.js')
    expect(xlsx.worksheets.first.rows_raw.size).to eq(3)
    expect(xlsx.worksheets.first.rows_raw[0].cells_raw.first.raw_text).to eq('John Smith:This is a comment.')
    expect(xlsx.worksheets.first.rows_raw[1].cells_raw.first.raw_text).to eq('Mark Potato:This is another comment.')
    expect(xlsx.worksheets.first.rows_raw[2].cells_raw.first.raw_text).to eq('James:Comment for range')
  end

  describe 'Api | AddCustomFunction method' do
    it 'Check base call' do
      skip('https://bugzilla.onlyoffice.com/show_bug.cgi?id=71568')
      xlsx = builder.build_and_parse('js/xlsx/smoke/api/add_custom_function/base_function.js')
      expect(xlsx.worksheets.first.rows_raw.size).to eq(1)
      expect(xlsx.worksheets.first.rows_raw.first.cells_raw.size).to eq(1)
      expect(xlsx.worksheets.first.rows_raw.first.cells_raw.first.reference).to eq('A1')
      expect(xlsx.worksheets.first.rows_raw.first.cells_raw.first.raw_text).to eq('3')
    end

    it 'Check call with spaces' do
      skip('https://bugzilla.onlyoffice.com/show_bug.cgi?id=71401')
      xlsx = builder.build_and_parse('js/xlsx/smoke/api/add_custom_function/with_spaces.js')
      expect(xlsx.worksheets.first.rows_raw.size).to eq(1)
      expect(xlsx.worksheets.first.rows_raw.first.cells_raw.size).to eq(1)
      expect(xlsx.worksheets.first.rows_raw.first.cells_raw.first.reference).to eq('A1')
      expect(xlsx.worksheets.first.rows_raw.first.cells_raw.first.raw_text).to eq('3')
    end

    it 'Check call without tag @customfunction' do
      path = 'js/xlsx/smoke/api/add_custom_function/without_desc_tag.js'
      expect { builder.build_and_parse(path) }.to raise_error(web_builder? ? WebDocBuilderError : DocBuilderError)
    end
  end

  it 'Api | RemoveCustomFunction method' do
    skip('https://bugzilla.onlyoffice.com/show_bug.cgi?id=71568')
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/remove_custom_function.js')
    expect(xlsx.worksheets.first.rows_raw.size).to eq(2)

    expect(xlsx.worksheets.first.rows_raw[0].cells_raw.size).to eq(1)
    expect(xlsx.worksheets.first.rows_raw[0].cells_raw.first.reference).to eq('A1')
    expect(xlsx.worksheets.first.rows_raw[0].cells_raw.first.raw_text).to eq('3')

    expect(xlsx.worksheets.first.rows_raw[1].cells_raw.size).to eq(1)
    expect(xlsx.worksheets.first.rows_raw[1].cells_raw.first.reference).to eq('A2')
    expect(xlsx.worksheets.first.rows_raw[1].cells_raw.first.raw_text).to eq('#NAME?')
  end

  it 'Api | ClearCustomFunctions method' do
    skip('https://bugzilla.onlyoffice.com/show_bug.cgi?id=71568')
    xlsx = builder.build_and_parse('js/xlsx/smoke/api/clear_custom_functions.js')
    expect(xlsx.worksheets.first.rows_raw.size).to eq(2)

    expect(xlsx.worksheets.first.rows_raw[0].cells_raw.size).to eq(2)
    expect(xlsx.worksheets.first.rows_raw[0].cells_raw[0].reference).to eq('A1')
    expect(xlsx.worksheets.first.rows_raw[0].cells_raw[0].raw_text).to eq('3')
    expect(xlsx.worksheets.first.rows_raw[0].cells_raw[1].reference).to eq('B1')
    expect(xlsx.worksheets.first.rows_raw[0].cells_raw[1].raw_text).to eq('1')

    expect(xlsx.worksheets.first.rows_raw[1].cells_raw.size).to eq(2)
    expect(xlsx.worksheets.first.rows_raw[1].cells_raw[0].reference).to eq('A2')
    expect(xlsx.worksheets.first.rows_raw[1].cells_raw[0].raw_text).to eq('#NAME?')
    expect(xlsx.worksheets.first.rows_raw[1].cells_raw[1].reference).to eq('B2')
    expect(xlsx.worksheets.first.rows_raw[1].cells_raw[1].raw_text).to eq('#NAME?')
  end
end

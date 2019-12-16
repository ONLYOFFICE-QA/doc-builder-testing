# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRun section tests' do
  it 'ApiRun | AddColumnBreak method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/add_column_break.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is the text for the first column. '\
           'It is written all in one text run. Nothing special.This is the text which '\
           'starts from the beginning of the second column. It is written in two text '\
           'runs, you need a space at the end of the first run sentence to separate them.')
    expect(docx.page_properties.columns.count).to eq(2)
  end

  it 'ApiRun | AddDrawing method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/add_drawing.js')
    expect(docx.elements.first.nonempty_runs.first.drawing.graphic.type).to eq(:chart)
    expect(docx.elements.first.nonempty_runs.first.drawing.graphic.data.type).to eq(:bar_3d)
    docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.series.each do |series|
      expect(series.categories.string.cache.points.map { |current_point| current_point.value.value }).to eq(%w[2014 2015 2016])
    end
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.series.first.text.string.cache.points.first.value.value).to eq('Projected Revenue')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.series.last.text.string.cache.points.first.value.value).to eq('Estimated Costs')
    expect(docx.elements.first.nonempty_runs.first.drawing.graphic.data.title.elements.first.runs.first.text).to eq('Financial Overview')
    expect(docx.elements.first.nonempty_runs.first.drawing.properties.object_size.x).to eq(OoxmlParser::OoxmlSize.new(4_051_299, :emu))
  end

  it 'ApiRun | AddLineBreak method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/add_line_break.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is the text for the first line. '\
           "Nothing special.\rThis is the text which starts from the beginning of the second line. "\
           'It is written in two text runs, you need a space at the end of the '\
           'first run sentence to separate them.')
  end

  it 'ApiRun | AddPageBreak method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/add_page_break.js')
    expect(docx.elements.first.nonempty_runs.first.break).to eq(:page)
  end

  it 'ApiRun | AddTabStop method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/add_tab_stop.js')
    expect(docx.elements.first
               .nonempty_runs.first.text).to eq('This is just a sample text. '\
                                                "After it three tab stops will be added.\t\t\t"\
                                                'This is the text which starts after the tab stops.')
  end

  it 'ApiRun | AddText method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/add_text.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is just a sample text. Nothing special.')
  end

  it 'ApiRun | ClearContent method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/clear_content.js')
    docx.elements.first.character_style_array.each do |current_run|
      expect(current_run.text).to be_empty
    end
    expect(docx.elements[1].nonempty_runs.first.text).to eq('The text in the previous paragraph cannot be seen, as it has been cleared.')
    expect(docx.elements[1].nonempty_runs.size).to eq(1)
  end

  it 'ApiRun | GetClassType method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/get_class_type.js')
    expect(docx.elements.last.nonempty_runs.first.text).to eq('Class Type = run')
  end

  it 'ApiRun | GetTextPr method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/get_text_pr.js')
    expect(docx.elements.first.nonempty_runs[1]
               .run_properties.run_style.referenced
               .run_properties.font).to eq('Calibri Light')
    expect(docx.elements.first.nonempty_runs[1]
               .run_properties.run_style.referenced
               .run_properties.caps).to eq(:caps)
  end

  it 'ApiRun | SetBold method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_bold.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('This is just a sample text. ')
    expect(docx.elements.first.nonempty_runs[1].font_style.bold).to be_truthy
  end

  it 'ApiRun | SetCaps method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_caps.js')
    expect(docx.elements.first.nonempty_runs[1].caps).to eq(:caps)
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the font set to capitalized letters.')
  end

  it 'ApiRun | SetColor method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_color.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the font color set to blue.')
    expect(docx.elements.first.nonempty_runs[1].font_color).to eq(OoxmlParser::Color.new(0, 0, 255))
  end

  it 'ApiRun | SetDoubleStrikeout method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_double_strikeout.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text struck out with two lines.')
    expect(docx.elements.first.nonempty_runs[1].font_style.strike).to eq(:double)
  end

  it 'ApiRun | SetFontFamily method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_font_family.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the font family set to \'Calibri Light\'.')
    expect(docx.elements.first.nonempty_runs[1].font).to eq('Calibri Light')
  end

  it 'ApiRun | SetFontSize method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_font_size.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the font size set to 15 points (30 half-points).')
    expect(docx.elements.first.nonempty_runs[1].size).to eq(15.0)
  end

  it 'ApiRun | SetHighlight method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_highlight.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text highlighted with yellow color.')
    expect(docx.elements.first.nonempty_runs[1].highlight).to eq('yellow')
  end

  it 'ApiRun | SetItalic method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_italic.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the font set to italicized letters.')
    expect(docx.elements.first.nonempty_runs[1].font_style.italic).to be_truthy
  end

  it 'ApiRun | SetLanguage method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_language.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text language set to English (Canada).')
    expect(docx.elements.first.nonempty_runs[1].run_properties.language.value).to eq('en-CA')
  end

  it 'ApiRun | SetPosition method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_position.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text raised 5 points (10 half-points).')
    expect(docx.elements.first.nonempty_runs[1].run_properties.position.value).to eq(OoxmlParser::OoxmlSize.new(10, :half_point))
    expect(docx.elements.first.nonempty_runs[2].text).to eq('This is a text run with the text lowered 8 points (16 half-points).')
    expect(docx.elements.first.nonempty_runs[2].run_properties.position.value).to eq(OoxmlParser::OoxmlSize.new(-16, :half_point))
  end

  it 'ApiRun | SetShd method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_shd.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text shading set to green.')
    expect(docx.elements.first.nonempty_runs[1].run_properties.shade.fill).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.nonempty_runs[1].run_properties.shade.value).to eq(:clear)
  end

  it 'ApiRun | SetSmallCaps method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_small_caps.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the font set to small capitalized letters.')
    expect(docx.elements.first.nonempty_runs[1].caps).to eq(:small_caps)
  end

  it 'ApiRun | SetSpacing method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_spacing.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text spacing set to 4 points (20 twentieths of a point).')
    expect(docx.elements.first.nonempty_runs[1].run_properties.spacing.value).to eq(OoxmlParser::OoxmlSize.new(80, :dxa))
  end

  it 'ApiRun | SetStrikeout method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_strikeout.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text struck out with a single line.')
    expect(docx.elements.first.nonempty_runs[1].font_style.strike).to eq(:single)
  end

  it 'ApiRun | SetStyle method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_style.js')
    expect(docx.elements.first.nonempty_runs[1]
               .run_properties.run_style
               .referenced.name).to eq('My New Run Style')
  end

  it 'ApiRun | SetUnderline method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_underline.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text underlined with a single line.')
    expect(docx.elements.first.nonempty_runs[1].font_style.underlined.style).to eq('single')
  end

  it 'ApiRun | SetVertAlign method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_run/set_vert_align.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text aligned below the baseline vertically. ')
    expect(docx.elements.first.nonempty_runs[1].vertical_align).to eq(:subscript)
    expect(docx.elements.first.nonempty_runs[3].text).to eq('This is a text run with the text aligned above the baseline vertically.')
    expect(docx.elements.first.nonempty_runs[3].vertical_align).to eq(:superscript)
  end
end

require 'spec_helper'
describe 'ApiRun section tests' do
  it 'ApiRun | AddLineBreak method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/add_line_break.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.size).to eq(2)
  end

  it 'ApiRun | AddTabStop method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/add_tab_stop.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.first.text).to eq("This is just a sample text. After it three tab stops will be added.\t\t\tThis is the text which starts after the tab stops.")
  end

  it 'ApiRun | AddText method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/add_text.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.first.text).to eq('This is just a sample text. Nothing special.')
  end

  it 'ApiRun | ClearContent method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/clear_content.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs).to be_empty
  end

  it 'ApiRun | GetClassType method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/get_class_type.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.first.text).to eq('Class Type = run')
  end

  it 'ApiRun | GetTextPr method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/get_text_pr.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.first.properties.font_size).to eq(15.0)
  end

  it 'ApiRun | SetBold method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/set_bold.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].properties.font_style.bold).to be true
  end

  it 'ApiRun | SetCaps method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/set_caps.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].properties.caps).to eq(:all)
  end

  it 'ApiRun | SetDoubleStrikeout method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/set_double_strikeout.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].properties.font_style.strike).to eq(:double)
  end

  it 'ApiRun | SetFill method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/set_fill.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].properties.font_color.color).to eq(OoxmlParser::Color.new(0, 0, 255))
  end

  it 'ApiRun | SetFontFamily method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/set_font_family.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].properties.font_name).to eq('Comic Sans MS')
  end

  it 'ApiRun | SetFontSize method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/set_font_size.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].properties.font_size).to eq(15.0)
  end

  it 'ApiRun | SetItalic method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/set_italic.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].properties.font_style.italic).to be true
  end

  it 'ApiRun | SetSmallCaps method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/set_small_caps.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].properties.caps).to eq(:small)
  end

  it 'ApiRun | SetSpacing method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/set_spacing.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].properties.space).to eq(OoxmlParser::OoxmlSize.new(80, :twip))
  end

  it 'ApiRun | SetStrikeout method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/set_strikeout.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].properties.font_style.strike).to eq(:single)
  end

  it 'ApiRun | SetUnderline method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/set_underline.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].properties.font_style.underlined.style).to eq(:single)
  end

  it 'ApiRun | SetVertAlign method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_run/set_vert_align.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].properties.baseline).to eq(:subscript)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[2].properties.baseline).to eq(:baseline)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[3].properties.baseline).to eq(:superscript)
  end
end

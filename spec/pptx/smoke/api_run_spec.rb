# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRun section tests' do
  it 'ApiRun | AddLineBreak method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/add_line_break.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq('This is the text for the first line. Nothing special.')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.text)
      .to eq("This is the text which starts from the beginning of the second line. It is written in two text runs, \
you need a space at the end of the first run sentence to separate them.")
  end

  it 'ApiRun | AddTabStop method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/add_tab_stop.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq("This is just a sample \
text. After it three tab stops will be added.\t\t\tThis is the text which starts after the tab stops.")
  end

  it 'ApiRun | AddText method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/add_text.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq('This is just a sample text. Nothing special.')
  end

  it 'ApiRun | ClearContent method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/clear_content.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs).to be_empty
    expect(pptx.slides.first.elements.first.text_body.paragraphs.last.runs).not_to be_empty
  end

  it 'ApiRun | GetClassType method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq('Class Type = run')
  end

  it 'ApiRun | GetTextPr method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/get_text_pr.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_size).to eq(15)
  end

  it 'ApiRun | SetBold method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/set_bold.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.properties.font_style.bold).to be true
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_style.bold).to be false
  end

  it 'ApiRun | SetCaps method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/set_caps.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.properties.caps).to eq(:all)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.caps).to be_nil
  end

  it 'ApiRun | SetDoubleStrikeout method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/set_double_strikeout.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.properties.font_style.strike).to eq(:double)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_style.strike).to eq(:none)
  end

  it 'ApiRun | SetFill method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/set_fill.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.properties.font_color.color).to eq(OoxmlParser::Color.new(255, 255, 0))
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_color.color).to eq(OoxmlParser::Color.new)
  end

  it 'ApiRun | SetFontFamily method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/set_font_family.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.properties.font_name).to eq('Comic Sans MS')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_name).to eq('Arial')
  end

  it 'ApiRun | SetFontSize method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/set_font_size.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.properties.font_size).to eq(25)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_size).to eq(18)
  end

  it 'ApiRun | SetItalic method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/set_italic.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.properties.font_style.italic).to be true
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_style.italic).to be false
  end

  it 'ApiRun | SetSmallCaps method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/set_small_caps.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.properties.caps).to eq(:small)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.caps).to be_nil
  end

  it 'ApiRun | SetSpacing method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/set_spacing.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.properties.space).to eq(OoxmlParser::OoxmlSize.new(80, :twip))
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.space).to be_nil
  end

  it 'ApiRun | SetStrikeout method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/set_strikeout.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.properties.font_style.strike).to eq(:single)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_style.strike).to eq(:none)
  end

  it 'ApiRun | SetUnderline method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/set_underline.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.properties.font_style.underlined).to eq(:single)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_style.underlined).to eq(:none)
  end

  it 'ApiRun | SetVertAlign method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_run/set_vert_align.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.baseline).to eq(:baseline)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs[1].properties.baseline).to eq(:subscript)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs[2].properties.baseline).to eq(:baseline)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.properties.baseline).to eq(:superscript)
  end
end

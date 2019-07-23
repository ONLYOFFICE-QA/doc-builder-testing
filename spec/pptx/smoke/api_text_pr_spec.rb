# frozen_string_literal: true

require 'spec_helper'
describe 'ApiTextPr section tests' do
  it 'ApiTextPr | GetClassType method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_text_pr/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq('Class Type = textPr')
  end

  it 'ApiTextPr | SetBold method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_text_pr/set_bold.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_style.bold).to be true
  end

  it 'ApiTextPr | SetCaps method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_text_pr/set_caps.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.caps).to eq(:all)
  end

  it 'ApiTextPr | SetDoubleStrikeout method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_text_pr/set_double_strikeout.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_style.strike).to eq(:double)
  end

  it 'ApiTextPr | SetFill method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_text_pr/set_fill.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_color.color).to eq(OoxmlParser::Color.new(255, 255, 0))
  end

  it 'ApiTextPr | SetFontFamily method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_text_pr/set_font_family.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_name).to eq('Comic Sans MS')
  end

  it 'ApiTextPr | SetFontSize method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_text_pr/set_font_size.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_size).to eq(15)
  end

  it 'ApiTextPr | SetItalic method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_text_pr/set_italic.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_style.italic).to be true
  end

  it 'ApiTextPr | SetSmallCaps method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_text_pr/set_small_caps.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.caps).to eq(:small)
  end

  it 'ApiTextPr | SetSpacing method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_text_pr/set_spacing.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.space).to eq(OoxmlParser::OoxmlSize.new(80, :twip))
  end

  it 'ApiTextPr | SetStrikeout method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_text_pr/set_strikeout.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_style.strike).to eq(:single)
  end

  it 'ApiTextPr | SetUnderline method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_text_pr/set_underline.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.font_style.underlined).to eq(:single)
  end

  it 'ApiTextPr | SetVertAlign method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_text_pr/set_vert_align.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.properties.baseline).to eq(:superscript)
  end
end

# frozen_string_literal: true

require 'spec_helper'
describe 'ApiTextPr section tests' do
  it 'ApiTextPr | GetClassType method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/get_class_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = textPr')
  end

  it 'ApiTextPr | SetBold method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_bold.js')
    expect(docx.elements.first.nonempty_runs.first.font_style.bold).to be_truthy
  end

  it 'ApiTextPr | SetCaps method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_caps.js')
    expect(docx.elements.first.nonempty_runs.first.caps).to eq(:caps)
  end

  it 'ApiTextPr | SetColor method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_color.js')
    expect(docx.elements.first.nonempty_runs.first.font_color).to eq(OoxmlParser::Color.new(0, 0, 255))
  end

  it 'ApiTextPr | SetDoubleStrikeout method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_double_strikeout.js')
    expect(docx.elements.first.nonempty_runs.first.font_style.strike).to eq(:double)
  end

  it 'ApiTextPr | SetFontFamily method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_font_family.js')
    expect(docx.elements.first.nonempty_runs.first.font).to eq('Comic Sans MS')
  end

  it 'ApiTextPr | SetFontSize method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_font_size.js')
    expect(docx.elements.first.nonempty_runs.first.size).to eq(15)
  end

  it 'ApiTextPr | SetHighlight method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_highlight.js')
    expect(docx.elements.first.nonempty_runs.first.highlight).to eq('yellow')
  end

  it 'ApiTextPr | SetItalic method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_italic.js')
    expect(docx.elements.first.nonempty_runs.first.font_style.italic).to be_truthy
  end

  it 'ApiTextPr | SetLanguage method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_language.js')
    expect(docx.styles.document_defaults.run_properties_default.run_properties.language.value).to eq('en-CA')
  end

  it 'ApiTextPr | SetPosition method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_position.js')
    expect(docx.styles.document_defaults.run_properties_default.run_properties.position.value).to eq(OoxmlParser::OoxmlSize.new(10, :half_point))
  end

  it 'ApiTextPr | SetShd method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_shd.js')
    expect(docx.elements.first.nonempty_runs.first.shade.fill).to eq(OoxmlParser::Color.new(0, 255, 0))
  end

  it 'ApiTextPr | SetSmallCaps method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_small_caps.js')
    expect(docx.elements.first.nonempty_runs.first.caps).to eq(:small_caps)
  end

  it 'ApiTextPr | SetSpacing method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_spacing.js')
    expect(docx.styles.document_defaults.run_properties_default.run_properties.spacing.value).to eq(OoxmlParser::OoxmlSize.new(80, :dxa))
  end

  it 'ApiTextPr | SetStrikeout method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_strikeout.js')
    expect(docx.elements.first.nonempty_runs.first.font_style.strike).to eq(:single)
  end

  it 'ApiTextPr | SetStyle method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_style.js')
    expect(docx.document_styles.last.name).to eq('My New Run Style')
    expect(docx.document_styles.last.run_properties.caps).to eq(:caps)
    expect(docx.document_styles.last.run_properties.font).to eq('Calibri Light')
  end

  it 'ApiTextPr | SetUnderline method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_underline.js')
    expect(docx.elements.first.nonempty_runs.first.font_style.underlined.style).to eq('single')
  end

  it 'ApiTextPr | SetVertAlign method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_text_pr/set_vert_align.js')
    expect(docx.elements.first.nonempty_runs.first.vertical_align).to eq(:subscript)
  end
end

require 'spec_helper'
describe 'ApiTextPr section tests' do
  it 'ApiTextPr | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_text_pr/get_class_type.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiTextPr | SetBold method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_text_pr/set_bold.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiTextPr | SetCaps method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_text_pr/set_caps.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiTextPr | SetDoubleStrikeout method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_text_pr/set_double_strikeout.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiTextPr | SetFill method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_text_pr/set_fill.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiTextPr | SetFontFamily method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_text_pr/set_font_family.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiTextPr | SetFontSize method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_text_pr/set_font_size.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiTextPr | SetItalic method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_text_pr/set_italic.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiTextPr | SetSmallCaps method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_text_pr/set_small_caps.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiTextPr | SetSpacing method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_text_pr/set_spacing.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiTextPr | SetStrikeout method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_text_pr/set_strikeout.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiTextPr | SetUnderline method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_text_pr/set_underline.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiTextPr | SetVertAlign method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_text_pr/set_vert_align.js')
    expect(xlsx).to be_with_data
  end
end

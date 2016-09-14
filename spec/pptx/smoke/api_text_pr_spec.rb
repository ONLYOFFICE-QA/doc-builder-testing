require 'spec_helper'
describe 'ApiTextPr section tests' do
  it 'ApiTextPr | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_text_pr/get_class_type.js')
    expect(pptx).to be_with_data
  end

  it 'ApiTextPr | SetBold method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_text_pr/set_bold.js')
    expect(pptx).to be_with_data
  end

  it 'ApiTextPr | SetCaps method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_text_pr/set_caps.js')
    expect(pptx).to be_with_data
  end

  it 'ApiTextPr | SetDoubleStrikeout method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_text_pr/set_double_strikeout.js')
    expect(pptx).to be_with_data
  end

  it 'ApiTextPr | SetFill method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_text_pr/set_fill.js')
    expect(pptx).to be_with_data
  end

  it 'ApiTextPr | SetFontFamily method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_text_pr/set_font_family.js')
    expect(pptx).to be_with_data
  end

  it 'ApiTextPr | SetFontSize method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_text_pr/set_font_size.js')
    expect(pptx).to be_with_data
  end

  it 'ApiTextPr | SetItalic method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_text_pr/set_italic.js')
    expect(pptx).to be_with_data
  end

  it 'ApiTextPr | SetSmallCaps method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_text_pr/set_small_caps.js')
    expect(pptx).to be_with_data
  end

  it 'ApiTextPr | SetSpacing method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_text_pr/set_spacing.js')
    expect(pptx).to be_with_data
  end

  it 'ApiTextPr | SetStrikeout method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_text_pr/set_strikeout.js')
    expect(pptx).to be_with_data
  end

  it 'ApiTextPr | SetUnderline method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_text_pr/set_underline.js')
    expect(pptx).to be_with_data
  end

  it 'ApiTextPr | SetVertAlign method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_text_pr/set_vert_align.js')
    expect(pptx).to be_with_data
  end
end

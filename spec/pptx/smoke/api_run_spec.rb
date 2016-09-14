require 'spec_helper'
describe 'ApiRun section tests' do
  it 'ApiRun | AddLineBreak method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/add_line_break.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | AddTabStop method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/add_tab_stop.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | AddText method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/add_text.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | ClearContent method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/clear_content.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/get_class_type.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | GetTextPr method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/get_text_pr.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | SetBold method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/set_bold.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | SetCaps method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/set_caps.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | SetDoubleStrikeout method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/set_double_strikeout.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | SetFill method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/set_fill.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | SetFontFamily method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/set_font_family.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | SetFontSize method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/set_font_size.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | SetItalic method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/set_italic.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | SetSmallCaps method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/set_small_caps.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | SetSpacing method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/set_spacing.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | SetStrikeout method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/set_strikeout.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | SetUnderline method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/set_underline.js')
    expect(pptx).to be_with_data
  end

  it 'ApiRun | SetVertAlign method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_run/set_vert_align.js')
    expect(pptx).to be_with_data
  end
end

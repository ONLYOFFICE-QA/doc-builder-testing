require 'spec_helper'
describe 'ApiRun section tests' do
  it 'ApiRun | AddLineBreak method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/add_line_break.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | AddTabStop method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/add_tab_stop.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | AddText method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/add_text.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | ClearContent method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/clear_content.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/get_class_type.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | GetTextPr method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/get_text_pr.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | SetBold method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/set_bold.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | SetCaps method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/set_caps.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | SetDoubleStrikeout method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/set_double_strikeout.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | SetFill method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/set_fill.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | SetFontFamily method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/set_font_family.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | SetFontSize method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/set_font_size.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | SetItalic method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/set_italic.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | SetSmallCaps method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/set_small_caps.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | SetSpacing method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/set_spacing.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | SetStrikeout method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/set_strikeout.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | SetUnderline method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/set_underline.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiRun | SetVertAlign method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_run/set_vert_align.js')
    expect(xlsx).to be_with_data
  end
end

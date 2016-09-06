require 'spec_helper'
describe 'ApiParagraph section tests' do
  it 'ApiParagraph | AddElement method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/add_element.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | AddLineBreak method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/add_line_break.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | AddTabStop method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/add_tab_stop.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | AddText method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/add_text.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/get_class_type.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | GetElement method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/get_element.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | GetElementsCount method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/get_elements_count.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | GetParaPr method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/get_para_pr.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | RemoveAllElements method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/remove_all_elements.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | RemoveElement method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/remove_element.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | SetBullet method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_bullet.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | SetIndFirstLine method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_ind_first_line.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | SetIndLeft method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_ind_left.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | SetIndRight method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_ind_right.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | SetJc method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_jc.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | SetSpacingAfter method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_spacing_after.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | SetSpacingBefore method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_spacing_before.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | SetSpacingLine method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_spacing_line.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParagraph | SetTabs method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_tabs.js')
    expect(xlsx).to be_with_data
  end
end

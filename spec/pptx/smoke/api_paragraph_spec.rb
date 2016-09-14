require 'spec_helper'
describe 'ApiParagraph section tests' do
  it 'ApiParagraph | AddElement method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/add_element.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | AddLineBreak method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/add_line_break.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | AddTabStop method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/add_tab_stop.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | AddText method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/add_text.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/get_class_type.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | GetElement method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/get_element.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | GetElementsCount method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/get_elements_count.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | GetParaPr method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/get_para_pr.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | RemoveAllElements method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/remove_all_elements.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | RemoveElement method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/remove_element.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | SetBullet method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_bullet.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | SetIndFirstLine method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_ind_first_line.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | SetIndLeft method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_ind_left.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | SetIndRight method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_ind_right.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | SetJc method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_jc.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | SetSpacingAfter method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_spacing_after.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | SetSpacingBefore method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_spacing_before.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | SetSpacingLine method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_spacing_line.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParagraph | SetTabs method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_tabs.js')
    expect(pptx).to be_with_data
  end
end

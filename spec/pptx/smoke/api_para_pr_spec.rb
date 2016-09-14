require 'spec_helper'
describe 'ApiParaPr section tests' do
  it 'ApiParaPr | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_para_pr/get_class_type.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParaPr | SetBullet method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_para_pr/set_bullet.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParaPr | SetIndFirstLine method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_para_pr/set_ind_first_line.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParaPr | SetIndLeft method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_para_pr/set_ind_left.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParaPr | SetIndRight method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_para_pr/set_ind_right.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParaPr | SetJc method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_para_pr/set_jc.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParaPr | SetSpacingAfter method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_para_pr/set_spacing_after.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParaPr | SetSpacingBefore method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_para_pr/set_spacing_before.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParaPr | SetSpacingLine method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_para_pr/set_spacing_line.js')
    expect(pptx).to be_with_data
  end

  it 'ApiParaPr | SetTabs method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_para_pr/set_tabs.js')
    expect(pptx).to be_with_data
  end
end

require 'spec_helper'
describe 'ApiParaPr section tests' do
  it 'ApiParaPr | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_para_pr/get_class_type.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParaPr | SetBullet method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_bullet.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParaPr | SetIndFirstLine method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_ind_first_line.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParaPr | SetIndLeft method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_ind_left.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParaPr | SetIndRight method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_ind_right.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParaPr | SetJc method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_jc.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParaPr | SetSpacingAfter method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_spacing_after.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParaPr | SetSpacingBefore method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_spacing_before.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParaPr | SetSpacingLine method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_spacing_line.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiParaPr | SetTabs method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_tabs.js')
    expect(xlsx).to be_with_data
  end
end

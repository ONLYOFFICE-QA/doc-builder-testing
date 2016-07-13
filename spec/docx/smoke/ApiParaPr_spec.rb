require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiParaPr section tests' do
  it 'ApiParaPr | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetBetweenBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setbetweenborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetBottomBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setbottomborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetContextualSpacing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setcontextualspacing.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetIndFirstLine method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setindfirstline.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetIndLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setindleft.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetIndRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setindright.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetJc method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setjc.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetKeepLines method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setkeeplines.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetKeepNext method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setkeepnext.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetLeftBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setleftborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetNumPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setnumpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetPageBreakBefore method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setpagebreakbefore.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetRightBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setrightborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setshd.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetSpacingAfter method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setspacingafter.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetSpacingBefore method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setspacingbefore.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetSpacingLine method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setspacingline.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setstyle.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetTabs method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/settabs.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetTopBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/settopborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParaPr | SetWidowControl method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setwidowcontrol.js')
    expect(docx.nil?).to eq(false)
  end
end

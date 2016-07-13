require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiParaPr sectin tests' do
  it 'GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetBetweenBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setbetweenborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetBottomBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setbottomborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetContextualSpacing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setcontextualspacing.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetIndFirstLine method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setindfirstline.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetIndLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setindleft.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetIndRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setindright.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetJc method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setjc.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetKeepLines method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setkeeplines.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetKeepNext method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setkeepnext.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetLeftBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setleftborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetNumPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setnumpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetPageBreakBefore method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setpagebreakbefore.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetRightBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setrightborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setshd.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetSpacingAfter method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setspacingafter.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetSpacingBefore method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setspacingbefore.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetSpacingLine method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setspacingline.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setstyle.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTabs method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/settabs.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTopBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/settopborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetWidowControl method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setwidowcontrol.js')
    expect(docx.nil?).to eq(false)
  end
end

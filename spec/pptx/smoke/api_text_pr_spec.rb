require 'spec_helper'
describe 'ApiTextPr section tests' do
  it 'ApiTextPr | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiTextPr/getclasstype.js')
    expect(pptx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetBold method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiTextPr/setbold.js')
    expect(pptx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetCaps method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiTextPr/setcaps.js')
    expect(pptx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetDoubleStrikeout method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiTextPr/setdoublestrikeout.js')
    expect(pptx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetFill method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiTextPr/setfill.js')
    expect(pptx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetFontFamily method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiTextPr/setfontfamily.js')
    expect(pptx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetFontSize method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiTextPr/setfontsize.js')
    expect(pptx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetItalic method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiTextPr/setitalic.js')
    expect(pptx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetSmallCaps method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiTextPr/setsmallcaps.js')
    expect(pptx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetSpacing method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiTextPr/setspacing.js')
    expect(pptx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetStrikeout method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiTextPr/setstrikeout.js')
    expect(pptx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetUnderline method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiTextPr/setunderline.js')
    expect(pptx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetVertAlign method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiTextPr/setvertalign.js')
    expect(pptx.nil?).to eq(false)
  end
end

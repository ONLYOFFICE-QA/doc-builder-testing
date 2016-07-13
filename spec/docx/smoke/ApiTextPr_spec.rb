require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiTextPr sectin tests' do
  it 'GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetBold method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setbold.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetCaps method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setcaps.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetColor method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setcolor.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetDoubleStrikeout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setdoublestrikeout.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetFontFamily method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setfontfamily.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetFontSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setfontsize.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetHighlight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/sethighlight.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetItalic method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setitalic.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetLanguage method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setlanguage.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetPosition method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setposition.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setshd.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetSmallCaps method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setsmallcaps.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetSpacing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setspacing.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetStrikeout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setstrikeout.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setstyle.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetUnderline method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setunderline.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetVertAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setvertalign.js')
    expect(docx.nil?).to eq(false)
  end
end

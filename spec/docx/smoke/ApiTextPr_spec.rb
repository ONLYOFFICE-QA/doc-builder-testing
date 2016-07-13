require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiTextPr section tests' do
  it 'ApiTextPr | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetBold method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setbold.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetCaps method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setcaps.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetColor method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setcolor.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetDoubleStrikeout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setdoublestrikeout.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetFontFamily method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setfontfamily.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetFontSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setfontsize.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetHighlight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/sethighlight.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetItalic method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setitalic.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetLanguage method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setlanguage.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetPosition method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setposition.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setshd.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetSmallCaps method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setsmallcaps.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetSpacing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setspacing.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetStrikeout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setstrikeout.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setstyle.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetUnderline method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setunderline.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetVertAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setvertalign.js')
    expect(docx.nil?).to eq(false)
  end
end

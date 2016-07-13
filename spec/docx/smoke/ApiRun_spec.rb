require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiRun sectin tests' do
  it 'AddColumnBreak method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addcolumnbreak.js')
    expect(docx.nil?).to eq(false)
  end

  it 'AddDrawing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/adddrawing.js')
    expect(docx.nil?).to eq(false)
  end

  it 'AddLineBreak method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addlinebreak.js')
    expect(docx.nil?).to eq(false)
  end

  it 'AddPageBreak method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addpagebreak.js')
    expect(docx.nil?).to eq(false)
  end

  it 'AddTabStop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addtabstop.js')
    expect(docx.nil?).to eq(false)
  end

  it 'AddText method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addtext.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ClearContent method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/clearcontent.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetTextPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/gettextpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetBold method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setbold.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetCaps method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setcaps.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetColor method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setcolor.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetDoubleStrikeout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setdoublestrikeout.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetFontFamily method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setfontfamily.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetFontSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setfontsize.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetHighlight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/sethighlight.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetItalic method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setitalic.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetLanguage method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setlanguage.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetPosition method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setposition.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setshd.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetSmallCaps method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setsmallcaps.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetSpacing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setspacing.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetStrikeout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setstrikeout.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setstyle.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetUnderline method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setunderline.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetVertAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setvertalign.js')
    expect(docx.nil?).to eq(false)
  end
end

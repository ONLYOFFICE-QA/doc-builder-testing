require 'spec_helper'
describe 'ApiRun section tests' do
  it 'ApiRun | AddColumnBreak method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addcolumnbreak.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | AddDrawing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/adddrawing.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | AddLineBreak method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addlinebreak.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | AddPageBreak method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addpagebreak.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | AddTabStop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addtabstop.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | AddText method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addtext.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | ClearContent method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/clearcontent.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | GetTextPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/gettextpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetBold method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setbold.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetCaps method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setcaps.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetColor method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setcolor.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetDoubleStrikeout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setdoublestrikeout.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetFontFamily method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setfontfamily.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetFontSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setfontsize.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetHighlight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/sethighlight.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetItalic method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setitalic.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetLanguage method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setlanguage.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetPosition method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setposition.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setshd.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetSmallCaps method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setsmallcaps.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetSpacing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setspacing.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetStrikeout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setstrikeout.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setstyle.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetUnderline method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setunderline.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiRun | SetVertAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setvertalign.js')
    expect(docx.nil?).to eq(false)
  end
end

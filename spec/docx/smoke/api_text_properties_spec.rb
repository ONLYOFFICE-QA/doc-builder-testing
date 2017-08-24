require 'spec_helper'
describe 'ApiTextPr section tests' do
  it 'ApiTextPr | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/getclasstype.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = textPr')
  end

  it 'ApiTextPr | SetBold method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setbold.js')
    expect(docx.elements.first.nonempty_runs.first.font_style.bold).to be_truthy
  end

  it 'ApiTextPr | SetCaps method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setcaps.js')
    expect(docx.elements.first.nonempty_runs.first.caps).to eq(:caps)
  end

  it 'ApiTextPr | SetColor method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setcolor.js')
    expect(docx.elements.first.nonempty_runs.first.font_color).to eq(OoxmlParser::Color.new(0, 0, 255))
  end

  it 'ApiTextPr | SetDoubleStrikeout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setdoublestrikeout.js')
    expect(docx.elements.first.nonempty_runs.first.font_style.strike).to eq(:double)
  end

  it 'ApiTextPr | SetFontFamily method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setfontfamily.js')
    expect(docx.elements.first.nonempty_runs.first.font).to eq('Comic Sans MS')
  end

  it 'ApiTextPr | SetFontSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setfontsize.js')
    expect(docx.elements.first.nonempty_runs.first.size).to eq(15)
  end

  it 'ApiTextPr | SetHighlight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/sethighlight.js')
    expect(docx.elements.first.nonempty_runs.first.highlight).to eq('yellow')
  end

  it 'ApiTextPr | SetItalic method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setitalic.js')
    expect(docx.elements.first.nonempty_runs.first.font_style.italic).to be_truthy
  end

  it 'ApiTextPr | SetLanguage method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/265'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setlanguage.js')
    expect(docx.elements.first.nonempty_runs.first.run_properties.language.value).to eq('en-CA')
  end

  it 'ApiTextPr | SetPosition method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/266'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setposition.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTextPr | SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setshd.js')
    expect(docx.elements.first.nonempty_runs.first.background_color).to eq(OoxmlParser::Color.new(0, 255, 0))
  end

  it 'ApiTextPr | SetSmallCaps method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setsmallcaps.js')
    expect(docx.elements.first.nonempty_runs.first.caps).to eq(:small_caps)
  end

  it 'ApiTextPr | SetSpacing method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/266'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setspacing.js')
    expect(docx.elements.first.nonempty_runs.first.spacing).to eq(false)
  end

  it 'ApiTextPr | SetStrikeout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setstrikeout.js')
    expect(docx.elements.first.nonempty_runs.first.font_style.strike).to eq(:single)
  end

  it 'ApiTextPr | SetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setstyle.js')
    expect(docx.document_styles.last.name).to eq('My New Run Style')
    expect(docx.document_styles.last.run_properties.caps).to eq(:caps)
    expect(docx.document_styles.last.run_properties.font).to eq('Calibri Light')
  end

  it 'ApiTextPr | SetUnderline method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setunderline.js')
    expect(docx.elements.first.nonempty_runs.first.font_style.underlined.style).to eq('single')
  end

  it 'ApiTextPr | SetVertAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTextPr/setvertalign.js')
    expect(docx.elements.first.nonempty_runs.first.vertical_align).to eq(:subscript)
  end
end

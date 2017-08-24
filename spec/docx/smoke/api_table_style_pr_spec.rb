require 'spec_helper'
describe 'ApiTableStylePr section tests' do
  it 'ApiTableStylePr | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/getclasstype.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = tableStylePr')
  end

  it 'ApiTableStylePr | GetParaPr method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/241'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/getparapr.js')
    expect(docx.elements[1].rows.first.cells.first.elements.first.align).to eq('This is a paragraph with the text in it aligned by the center.')
  end

  it 'ApiTableStylePr | GetTableCellPr method' do
    skip 'https://github.com/ONLYOFFICE/ooxml_parser/issues/242'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettablecellpr.js')
    expect(docx.elements[1].rows.first.cells.first.properties.color).to eq(false)
  end

  it 'ApiTableStylePr | GetTablePr method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/243'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettablepr.js')
    expect(docx.elements[1]).to eq(false)
  end

  it 'ApiTableStylePr | GetTableRowPr method' do
    skip ' Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/239'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettablerowpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableStylePr | GetTextPr method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/244'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettextpr.js')
    expect(docx.elements[1].rows.first.cells.first.elements.first.nonempty_runs.first.font_style.bold).to be_truthy
  end

  it 'ApiTableStylePr | GetType method' do
    skip 'Documentation error http://192.168.4.102/developers/document-builder/ApiTableStylePr/GetType.aspx'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableStylePr/gettype.js')
    expect(docx.nil?).to eq(false)
  end
end

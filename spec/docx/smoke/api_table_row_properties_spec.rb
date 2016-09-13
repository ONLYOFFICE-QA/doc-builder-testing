require 'spec_helper'
describe 'ApiTableRowPr section tests' do
  it 'ApiTableRowPr | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRowPr/getclasstype.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('Class Type = tableRowPr')
  end

  it 'ApiTableRowPr | SetHeight method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/239'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRowPr/setheight.js')
    expect(docx.elements[1]).to eq(false)
  end

  it 'ApiTableRowPr | SetTableHeader method' do
    skip 'Documentation error'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRowPr/settableheader.js')
    expect(docx.nil?).to eq(false)
  end
end

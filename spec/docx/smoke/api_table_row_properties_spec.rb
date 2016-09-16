require 'spec_helper'
describe 'ApiTableRowPr section tests' do
  it 'ApiTableRowPr | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRowPr/getclasstype.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('Class Type = tableRowPr')
  end

  it 'ApiTableRowPr | SetHeight method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/263'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRowPr/setheight.js')
    expect(docx.elements[1].properties.table_style.table_row_properties.height.value).to eq(OoxmlParser::OoxmlSize.new(720, twip))
    expect(docx.elements[1].properties.table_style.table_row_properties.height.type).to eq('atLeast')
  end

  it 'ApiTableRowPr | SetTableHeader method' do
    skip 'Documentation error. Example will edit'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRowPr/settableheader.js')
    expect(docx.nil?).to eq(false)
  end
end

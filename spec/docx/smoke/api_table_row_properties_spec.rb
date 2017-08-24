require 'spec_helper'
describe 'ApiTableRowPr section tests' do
  it 'ApiTableRowPr | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRowPr/getclasstype.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = tableRowPr')
  end

  it 'ApiTableRowPr | SetHeight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRowPr/setheight.js')
    expect(docx.elements[1].properties.table_style.table_row_properties.height.value).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableRowPr | SetTableHeader method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRowPr/settableheader.js')
    expect(docx.elements[1].properties.table_style.table_row_properties.table_header).to be_truthy
  end
end

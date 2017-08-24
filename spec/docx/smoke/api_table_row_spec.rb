require 'spec_helper'
describe 'ApiTableRow section tests' do
  it 'ApiTableRow | GetCell method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/getcell.js')
    expect(docx.elements[1].rows.first.cells[1].properties.vertical_align).to eq(:bottom)
  end

  it 'ApiTableRow | GetCellsCount method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/getcellscount.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Number of cells in the first row = 3')
  end

  it 'ApiTableRow | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/getclasstype.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = tableRow')
  end

  it 'ApiTableRow | SetHeight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/setheight.js')
    expect(docx.elements[1].rows.first.table_row_properties.height.value).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableRow | SetTableHeader method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/settableheader.js')
    expect(docx.elements[1].rows.first.table_row_properties.table_header).to be_truthy
  end
end

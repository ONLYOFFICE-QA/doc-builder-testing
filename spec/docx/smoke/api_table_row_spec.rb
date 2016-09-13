require 'spec_helper'
describe 'ApiTableRow section tests' do
  it 'ApiTableRow | GetCell method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/getcell.js')
    expect(docx.elements[1].rows.first.cells[1].properties.vertical_align).to eq(:bottom)
  end

  it 'ApiTableRow | GetCellsCount method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/getcellscount.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('Number of cells in the first row = 3')
  end

  it 'ApiTableRow | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/getclasstype.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('Class Type = tableRow')
  end

  it 'ApiTableRow | SetHeight method' do
    skip ' Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/239'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/setheight.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableRow | SetTableHeader method' do
    skip 'Documentation error http://192.168.4.102/developers/document-builder/ApiTableRow/SetTableHeader.aspx'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableRow/settableheader.js')
    expect(docx.nil?).to eq(false)
  end
end

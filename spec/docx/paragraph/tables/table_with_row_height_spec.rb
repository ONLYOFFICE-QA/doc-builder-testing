require 'spec_helper'

describe 'Add table custom rows height' do
  it '1-st row: auto, 2-nd row: 1000, 3-rd row: 2000' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/tables/table_with_row_height.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].rows.first.table_row_properties.height).to be_nil
    expect(docx.elements[1].rows[1].table_row_properties.height.value).to eq(OoxmlParser::OoxmlSize.new(1000))
    expect(docx.elements[1].rows[2].table_row_properties.height.value).to eq(OoxmlParser::OoxmlSize.new(2000))
  end
end

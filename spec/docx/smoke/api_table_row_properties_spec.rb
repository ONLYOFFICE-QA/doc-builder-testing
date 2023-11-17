# frozen_string_literal: true

require 'spec_helper'
describe('ApiTableRowPr section tests') do
  it 'ApiTableRowPr | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_row_pr/set_height.js')
    expected_height = OoxmlParser::OoxmlSize.new(720, :twip)
    actual_height = docx.elements[1].properties.table_style.table_row_properties.height.value
    expect(actual_height).to eq(expected_height)
  end

  it 'ApiTableRowPr | SetHeight method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_row_pr/set_height.js')
    expect(docx.elements[0].nonempty_runs[0].text).to eq('We create a 3x3 table and set the height of half an inch to all the rows:')
    table_row_pr = docx.elements[1].properties.table_style.table_row_properties
    expect(table_row_pr.height.value).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableRowPr | SetTableHeader method' do
    # Build and parse the document
    docx = builder.build_and_parse('js/docx/smoke/api_table_row_pr/set_table_header.js')
    # Check the content of the first paragraph
    expected_text = 'We create a 3x3 table and set all table rows as the table headers:'
    actual_text = docx.elements.first.nonempty_runs.first.text
    expect(actual_text).to eq(expected_text)
    # Check if the table has the correct style
    table_style = docx.elements[1].properties.table_style
    expect(table_style).not_to be_nil
    expect(table_style.table_row_properties).not_to be_nil
    # Check if the table header property is set to true
    expect(table_style.table_row_properties.table_header).to be(true)
  end
end

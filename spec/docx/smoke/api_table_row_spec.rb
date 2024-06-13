# frozen_string_literal: true

require 'spec_helper'
describe 'ApiTableRow section tests' do
  it 'ApiTableRow | GetCell method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_row/get_cell.js')
    expect(docx.elements[1].rows.first.cells[1].properties.vertical_align).to eq(:bottom)
  end

  it 'ApiTableRow | GetCellsCount method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_row/get_cells_count.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Number of cells in the first row = 3')
  end

  it 'ApiTableRow | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_row/get_class_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = tableRow')
  end

  it 'ApiTableRow | SetHeight method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_row/set_height.js')
    expect(docx.elements[1].rows.first.table_row_properties.height.value).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableRow | SetTableHeader method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_row/set_table_header.js')
    expect(docx.elements[1].rows.first.table_row_properties.table_header).to be_truthy
  end

  it 'ApiTableRow | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_row/to_json.js')
    json = JSON.parse(docx.elements[4].nonempty_runs.first.text)
    expect("#{docx.elements[1].nonempty_runs.first.text}Pr").to eq(json['type'])
    expect(docx.elements[2].rows[1].table_row_properties.height.value.value).to eq(json['trHeight']['val'].to_f)
  end
end

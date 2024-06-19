# frozen_string_literal: true

require 'spec_helper'
describe 'ApiTableRowPr section tests' do
  it 'ApiTableRowPr | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_row_pr/get_class_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = tableRowPr')
  end

  it 'ApiTableRowPr | SetHeight method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_row_pr/set_height.js')
    expect(docx.elements[1].properties.table_style.table_row_properties.height.value).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableRowPr | SetTableHeader method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_row_pr/set_table_header.js')
    expect(docx.elements[1].properties.table_style.table_row_properties.table_header).to be_truthy
  end

  it 'ApiTableRowPr | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_row_pr/to_json.js')
    json = JSON.parse(docx.elements[3].nonempty_runs[0].text)
    expect(docx.elements[0].nonempty_runs[0].text).to eq(json['type'])
    expect(docx.elements[1].properties.table_style.table_row_properties.height.value).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end
end

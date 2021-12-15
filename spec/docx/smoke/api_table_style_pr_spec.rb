# frozen_string_literal: true

require 'spec_helper'
describe 'ApiTableStylePr section tests' do
  it 'ApiTableStylePr | GetClassType method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_style_pr/get_class_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = tableStylePr')
  end

  it 'ApiTableStylePr | GetParaPr method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_style_pr/get_para_pr.js')
    expect(docx.elements[1].properties
               .table_style.table_style_properties_list
               .first.paragraph_properties.justification).to eq(:center)
  end

  it 'ApiTableStylePr | GetTableCellPr method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_style_pr/get_table_cell_pr.js')
    shade = docx.elements[1].table_properties.table_style
                .northwest_cell.cell_properties.shade
    expect(shade.color.upcase)
      .to eq(OoxmlParser::Color.new(238, 238, 238).to_hex.to_sym)
    expect(shade.value).to eq(:clear)
  end

  it 'ApiTableStylePr | GetTablePr method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_style_pr/get_table_pr.js')
    bottom_border = docx.document_style_by_name('CustomTableStyle')
                        .table_style_properties_list.first.table_properties
                        .table_borders.bottom
    expect(bottom_border.val).to eq(:single)
    expect(bottom_border.space).to eq(OoxmlParser::OoxmlSize.new(0))
    expect(bottom_border.size).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(bottom_border.color).to eq(OoxmlParser::Color.new(0, 255, 0))
  end

  it 'ApiTableStylePr | GetTableRowPr method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_style_pr/get_table_row_pr.js')
    expect(docx.document_style_by_name('CustomTableStyle')
               .table_style_properties_list
               .first.table_row_properties
               .height.value).to eq(OoxmlParser::OoxmlSize.new(720, :dxa))
  end

  it 'ApiTableStylePr | GetTextPr method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_style_pr/get_text_pr.js')
    expect(docx.elements[1].properties.table_style.table_style_properties_list.first.run_properties.font_style.bold).to be_truthy
  end

  it 'ApiTableStylePr | GetType method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_table_style_pr/get_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Style type = topLeftCell')
  end
end

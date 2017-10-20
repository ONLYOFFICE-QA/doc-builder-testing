require 'spec_helper'
describe 'ApiTableStylePr section tests' do
  it 'ApiTableStylePr | GetClassType method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_table_style_pr/get_class_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = tableStylePr')
  end

  it 'ApiTableStylePr | GetParaPr method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/241'
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_table_style_pr/get_para_pr.js')
    expect(docx.elements[1].rows.first.cells.first.elements.first.align).to eq('This is a paragraph with the text in it aligned by the center.')
  end

  it 'ApiTableStylePr | GetTableCellPr method' do
    skip 'https://github.com/ONLYOFFICE/ooxml_parser/issues/242'
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_table_style_pr/get_table_cell_pr.js')
    expect(docx.elements[1].rows.first.cells.first.properties.color).to eq(false)
  end

  it 'ApiTableStylePr | GetTablePr method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/243'
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_table_style_pr/get_table_pr.js')
    expect(docx.elements[1]).to eq(false)
  end

  it 'ApiTableStylePr | GetTableRowPr method' do
    skip ' Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/239'
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_table_style_pr/get_table_row_pr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableStylePr | GetTextPr method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_table_style_pr/get_text_pr.js')
    expect(docx.elements[1].properties.table_style.table_style_properties_list.first.run_properties.font_style.bold).to be_truthy
  end

  it 'ApiTableStylePr | GetType method' do
    skip 'Documentation error http://192.168.4.102/developers/document-builder/api_table_style_pr/get_type.aspx'
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_table_style_pr/gettype.js')
    expect(docx.nil?).to eq(false)
  end
end

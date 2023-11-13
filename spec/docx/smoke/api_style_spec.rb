# frozen_string_literal: true

require 'spec_helper'
describe 'ApiStyle section tests' do
  it 'ApiStyle | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_style/get_class_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = style')
    expect(docx.elements[1].class).to eq(OoxmlParser::Table)
  end

  it 'ApiStyle | GetConditionalTableStyle method' do
    skip('https://github.com/ONLYOFFICE/ooxml_parser/issues/1214')
    docx = builder.build_and_parse('js/docx/smoke/api_style/get_conditional_table_style.js')
    table_style = docx.elements[1].properties.table_style
    expect(table_style.table_style_properties_list[0]
               .run_properties.font_style.italic).to be_truthy
    expect(table_style.table_style_properties_list[1]
               .run_properties).to be_nil
  end

  it 'ApiStyle | GetName method' do
    docx = builder.build_and_parse('js/docx/smoke/api_style/get_name.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Table style name = My Custom Style')
  end

  it 'ApiStyle | GetParaPr method' do
    docx = builder.build_and_parse('js/docx/smoke/api_style/get_para_pr.js')
    expect(docx.elements.first.spacing.line).to eq(2)
    expect(docx.elements.first.spacing.line_rule).to eq(:auto)
    expect(docx.elements.first.ind.first_line_indent).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiStyle | GetTableCellPr method' do
    docx = builder.build_and_parse('js/docx/smoke/api_style/get_table_cell_pr.js')
    table_style = docx.elements[1].properties.table_style
    expect(table_style.northwest_cell.table_cell_properties
               .shade.color.upcase).to eq(OoxmlParser::Color.new(255, 0, 0).to_hex.to_sym)
    expect(table_style.northeast_cell.table_cell_properties
               .shade.color.upcase).to eq(OoxmlParser::Color.new(0, 255, 0).to_hex.to_sym)
    expect(table_style.southwest_cell.table_cell_properties
               .shade.color.upcase).to eq(OoxmlParser::Color.new(0, 0, 255).to_hex.to_sym)
    expect(table_style.southeast_cell.table_cell_properties
               .shade.color.upcase).to eq(OoxmlParser::Color.new(255, 255, 0).to_hex.to_sym)
  end

  it 'ApiStyle | GetTablePr method' do
    docx = builder.build_and_parse('js/docx/smoke/api_style/get_table_pr.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.top).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.left).to eq(OoxmlParser::OoxmlSize.new(120, :twip))
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.right).to eq(OoxmlParser::OoxmlSize.new(120, :twip))
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.bottom).to eq(OoxmlParser::OoxmlSize.new(0, :twip))
  end

  it 'ApiStyle | GetTableRowPr method' do
    docx = builder.build_and_parse('js/docx/smoke/api_style/get_table_row_pr.js')
    expect(docx.elements[1].properties.table_style.table_row_properties.height.value).to eq(OoxmlParser::OoxmlSize.new(1440))
  end

  it 'ApiStyle | GetTextPr method' do
    docx = builder.build_and_parse('js/docx/smoke/api_style/get_text_pr.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('This is a paragraph with the text color, font family and font size set using the text style. ')
    expect(docx.elements.first.nonempty_runs[0].font).to eq('Calibri Light')
    expect(docx.elements.first.nonempty_runs[0].font_color).to eq(OoxmlParser::Color.new(38, 38, 38))
    expect(docx.elements.first.nonempty_runs[1].text).to eq('We do not change the style of the paragraph itself. ')
    expect(docx.elements.first.nonempty_runs[1].font_color).to eq(OoxmlParser::Color.new(38, 38, 38))
    expect(docx.elements.first.nonempty_runs[1].font).to eq('Calibri Light')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Only document-wide text styles are applied.')
    expect(docx.elements.first.nonempty_runs[2].font_color).to eq(OoxmlParser::Color.new(38, 38, 38))
    expect(docx.elements.first.nonempty_runs[2].font).to eq('Calibri Light')
  end

  it 'ApiStyle | GetType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_style/get_type.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('Style type = table')
  end

  it 'ApiStyle | SetBasedOn method' do
    docx = builder.build_and_parse('js/docx/smoke/api_style/set_based_on.js')
    style_name = docx.elements[1].properties.table_style.name
    expect(style_name).to eq('CustomTableStyle')
    expect(docx.document_style_by_name(style_name).based_on_style.name).to eq('Bordered - Accent 5')
  end

  it 'ApiStyle | SetName method' do
    docx = builder.build_and_parse('js/docx/smoke/api_style/set_name.js')
    expect(docx.elements[1].properties.table_style.name).to eq('My Custom Style')
  end
  it 'ApiStyle | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_style/to_json.js')
    json = JSON.parse(docx.elements[22].nonempty_runs[0].text)
    DocBuilderStaticData::DEFAULT_STYLES.each_with_index do |style, index|
      # TODO: To understand why incorrect names are recorded
      next if (style == 'Header') || # in the metadata: Custom_Style 719 styleId: 42
        (style == 'Footer') || # in the metadata: Custom_Style 725 styleId: 44
        (style == 'Footnote text') || # in the metadata: Normal styleId: styleId => 599
        (style == 'Endnote text') # in the metadata: Normal styleId: styleId => 599

      expect(docx.elements[index + 1].style.name).to eq(style)
      expect(JSON.parse(json[style])['name']).to eq(style)
    end
  end
end

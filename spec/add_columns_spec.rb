require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Check Column' do

  it '[Text] One Column' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/pc/Documents/temp_docx/one_column.docx')
    expect(docx.page_properties.columns.count).to eq(1)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.elements[1].character_style_array.first.text).to eq('First Columns')
  end

  it '[Text] Two Columns' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/pc/Documents/temp_docx/two_columns.docx')
    expect(docx.page_properties.columns.count).to eq(2)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.elements[1].character_style_array.first.text).to eq('First Columns')
    expect(docx.elements[2].character_style_array.first.text).to eq('Second Columns')
  end

  it '[Text] Three Columns' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/pc/Documents/temp_docx/three_columns.docx')
    expect(docx.page_properties.columns.count).to eq(3)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.elements[1].character_style_array.first.text).to eq('First Columns')
    expect(docx.elements[2].character_style_array.first.text).to eq('Second Columns')
    expect(docx.elements[3].character_style_array.first.text).to eq('Third Columns')
  end

  it '[Table] One Column' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/pc/Documents/temp_docx/add_table_in_one_column.docx')
    expect(docx.page_properties.columns.count).to eq(1)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.element_by_description[1].class).to eq(Table)
    expect(docx.element_by_description[1].rows.length).to eq(3)
    expect(docx.element_by_description[1].rows[0].cells.length).to eq(3)
  end

  it '[Table] Two Columns' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/pc/Documents/temp_docx/add_table_in_two_columns.docx')
    expect(docx.page_properties.columns.count).to eq(2)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.element_by_description[1].class).to eq(Table)
    expect(docx.element_by_description[1].rows.length).to eq(3)
    expect(docx.element_by_description[1].rows[0].cells.length).to eq(3)
    expect(docx.element_by_description[2].class).to eq(Table)
    expect(docx.element_by_description[2].rows.length).to eq(3)
    expect(docx.element_by_description[2].rows[0].cells.length).to eq(3)
  end

  it '[Text] Three Columns' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/pc/Documents/temp_docx/add_table_in_three_columns.docx')
    expect(docx.page_properties.columns.count).to eq(3)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.element_by_description[1].class).to eq(Table)
    expect(docx.element_by_description[1].rows.length).to eq(3)
    expect(docx.element_by_description[1].rows[0].cells.length).to eq(3)
    expect(docx.element_by_description[2].class).to eq(Table)
    expect(docx.element_by_description[2].rows.length).to eq(3)
    expect(docx.element_by_description[2].rows[0].cells.length).to eq(3)
    expect(docx.element_by_description[3].class).to eq(Table)
    expect(docx.element_by_description[3].rows.length).to eq(3)
    expect(docx.element_by_description[3].rows[0].cells.length).to eq(3)
  end
end

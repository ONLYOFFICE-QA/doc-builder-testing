require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Text with tabs' do

  it 'One Column' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/pc/Documents/temp_docx/one_column.docx')
    expect(docx.page_properties.columns.count).to eq(1)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.elements[1].character_style_array.first.text).to eq('First Columns')
  end

  it 'Two Columns' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/pc/Documents/temp_docx/two_columns.docx')
    expect(docx.page_properties.columns.count).to eq(2)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.elements[1].character_style_array.first.text).to eq('First Columns')
    expect(docx.elements[2].character_style_array.first.text).to eq('Second Columns')
  end

  it 'Three Columns' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/pc/Documents/temp_docx/three_columns.docx')
    expect(docx.page_properties.columns.count).to eq(3)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.elements[1].character_style_array.first.text).to eq('First Columns')
    expect(docx.elements[2].character_style_array.first.text).to eq('Second Columns')
    expect(docx.elements[3].character_style_array.first.text).to eq('Third Columns')
  end
end

require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Add tables with types of vertical align' do

  it 'Table with vertical align: Top' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_verticalalign_top.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.first.elements.first.character_style_array[1].text).to eq('Top')
    expect(docx.elements[1].rows.first.cells.first.properties.vertical_align).to eq(:top)
  end

  it 'Table with vertical align: Center' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_verticalalign_center.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.first.elements.first.character_style_array[1].text).to eq('Center')
    expect(docx.elements[1].rows.first.cells.first.properties.vertical_align).to eq(:center)
  end

  it 'Table with vertical align: Bottom' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_verticalalign_bottom.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.first.elements.first.character_style_array[1].text).to eq('Bottom')
    expect(docx.elements[1].rows.first.cells.first.properties.vertical_align).to eq(:bottom)
  end
  end




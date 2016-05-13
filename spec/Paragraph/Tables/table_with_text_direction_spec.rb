require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Add tables with different text direction' do

  it 'Table with text direction: Left To Right' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_textdirection_ltr.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows[2].cells.first.elements.first.character_style_array[1].text).to eq('left to right')
    expect(docx.elements[1].rows[2].cells.first.properties.text_direction).to eq(:horizontal)
  end

  it 'Table with text direction: Top To Bottom' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_textdirection_ttb.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows[2].cells.first.elements.first.character_style_array[1].text).to eq('top to bottom')
    expect(docx.elements[1].rows[2].cells.first.properties.text_direction).to eq(:horizontal)
    end

    it 'Table with text direction: Right To Left' do
      docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_textdirection_rtl.docx')
      expect(docx.elements[1].rows.length).to eq(3)
      expect(docx.elements[1].rows[2].cells[1].elements.first.character_style_array[1].text).to eq('right to left')
      expect(docx.elements[1].rows[2].cells[1].properties.text_direction).to eq(:rotate_on_90)
    end

    it 'Table with text direction: Bottom To Top' do
      docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_textdirection_btt.docx')
      expect(docx.elements[1].rows.length).to eq(3)
      expect(docx.elements[1].rows[2].cells[2].elements.first.character_style_array[1].text).to eq('bottom to top')
      expect(docx.elements[1].rows[2].cells[2].properties.text_direction).to eq(:rotate_on_270)
  end
end




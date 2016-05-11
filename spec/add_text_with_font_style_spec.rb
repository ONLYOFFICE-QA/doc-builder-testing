require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'My behaviour' do

  it 'Text should be bold' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_bold_in_paragraph.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('Bold')
    expect(docx.elements[1].character_style_array.first.font_style.bold).to be_truthy
  end

    it 'Text should be italic' do
      docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_italic_in_paragraph.docx')
      expect(docx.elements[1].character_style_array.first.text).to eq('Italic')
      expect(docx.elements[1].character_style_array.first.font_style.italic).to be_truthy
    end

      it 'Text shopuld be strikeout' do
        docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_strikeout_in_paragraph.docx')
        expect(docx.elements[1].character_style_array.first.text).to eq('Strikeout')
        expect(docx.elements[1].character_style_array.first.font_style.strike).to eq(:single)
      end

        it 'Text should be underline' do
          docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_setunderline_in_paragraph.docx')
          expect(docx.elements[1].character_style_array.first.text).to eq('Underline')
          expect(docx.elements[1].character_style_array.first.font_style.underlined.style).to eq('single')
  end
end

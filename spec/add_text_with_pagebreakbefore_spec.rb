require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Check pagebreak' do

  it 'Pagebreak' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_pagebreakbefore.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('PageBreakBefore')
    expect(docx.elements[1].page_break).to eq(true)
  end
end

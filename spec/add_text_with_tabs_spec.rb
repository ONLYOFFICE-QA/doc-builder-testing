require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Text with tabs' do

  it 'Tabs' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_tabs.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('Tabs')
    expect(docx.elements[1].tabs.first.position).to eq(1.76)
    expect(docx.elements[1].tabs.first.align).to eq(:center)
    expect(docx.elements[1].tabs[1].position).to eq(2.65)
    expect(docx.elements[1].tabs[1].align).to eq(:left)
    expect(docx.elements[1].tabs[2].position).to eq(5.29)
    expect(docx.elements[1].tabs[2].align).to eq(:right)
  end
end

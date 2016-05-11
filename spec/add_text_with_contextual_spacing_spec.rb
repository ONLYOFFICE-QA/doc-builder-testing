require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Check contextual spacing' do

  it 'Contextual spacing' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_text_with_contextualspacing.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('True')
    expect(docx.elements[1].contextual_spacing).to eq(true)
  end
end

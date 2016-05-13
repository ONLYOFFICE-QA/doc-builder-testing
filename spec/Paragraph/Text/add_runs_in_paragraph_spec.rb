require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Add runs in paragraph' do

  it 'Add Run' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/add_run.docx')
    expect(docx.elements[1].character_style_array.first.text).to eq('Run	StopRun')
  end
  end




require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Add deafult table in header' do

  it 'Default table in footer ' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx//default_table_in_header.docx')
    expect(docx.notes.first.elements[1].rows.length).to eq(3)
  end

  it 'Table with right alignment' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx//default_table_in_header_right.docx')
    expect(docx.notes.first.elements[1].rows.length).to eq(3)
    expect(docx.notes.first.elements[1].properties.jc).to eq(:right)

  end
end




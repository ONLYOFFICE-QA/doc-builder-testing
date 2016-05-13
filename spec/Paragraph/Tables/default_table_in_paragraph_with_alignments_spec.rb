require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Add deafult table with alignments' do

  it 'Table with center alignment' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/default_table_in_paragraph_center.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].properties.jc).to eq(:center)
  end

  it 'Table with left alignment' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/default_table_in_paragraph_left.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].properties.jc).to eq(:left)
  end

  it 'Table with right alignment' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/default_table_in_paragraph_right.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].properties.jc).to eq(:right)
  end
end




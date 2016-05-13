require 'bundler/setup'
require 'rspec'
require 'ooxml_parser'

describe 'Add tables with differnt types of width' do

  it 'Table with auto width' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_width_auto.js.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].properties.table_width).to eq(0.0)
  end

  it 'Table with width in percent' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_width_percent.js.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].properties.table_width).to eq(8.818342151675486)
  end

  it 'Table with fixed layout' do
    docx = OoxmlParser::DocxParser.parse_docx('/home/ilya/Documents/temp_docx/table_with_fixed_layout.docx')
    expect(docx.elements[1].rows.length).to eq(3)
    'Not finished'
  end
end




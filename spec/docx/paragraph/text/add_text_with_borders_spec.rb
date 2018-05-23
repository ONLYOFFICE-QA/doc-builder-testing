require 'spec_helper'

describe 'Check borders' do
  it 'Borders' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/text/add_text_with_borders.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Borders')
    expect(docx.elements[1].borders.between.color).to eq(OoxmlParser::Color.new(255, 0, 255))
    expect(docx.elements[1].borders.bottom.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements[1].borders.left.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].borders.right.color).to eq(OoxmlParser::Color.new(255, 255, 0))
    expect(docx.elements[1].borders.top.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements[2].nonempty_runs.first.text).to eq('Borders')
    expect(docx.elements[2].borders.between.color).to eq(OoxmlParser::Color.new(255, 0, 255))
    expect(docx.elements[2].borders.bottom.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements[2].borders.left.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[2].borders.right.color).to eq(OoxmlParser::Color.new(255, 255, 0))
    expect(docx.elements[2].borders.top.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements[3].nonempty_runs.first.text).to eq('Borders')
    expect(docx.elements[3].borders.between.color).to eq(OoxmlParser::Color.new(255, 0, 255))
    expect(docx.elements[3].borders.bottom.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements[3].borders.left.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[3].borders.right.color).to eq(OoxmlParser::Color.new(255, 255, 0))
    expect(docx.elements[3].borders.top.color).to eq(OoxmlParser::Color.new(255, 0, 0))
  end
end

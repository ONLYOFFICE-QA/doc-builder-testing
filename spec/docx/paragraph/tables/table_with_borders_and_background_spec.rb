require 'bundler/setup'
require 'rspec'
require_relative '../../../../lib/doc_builder_testing'

describe 'Add table with borders and background' do

  it 'Table with borders' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/tables/table_with_borders.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.between.color).to eq(OoxmlParser::Color.new(0,0,0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.between.sz).to eq(0.5)
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.bottom.color).to eq(OoxmlParser::Color.new(0,0,0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.bottom.sz).to eq(0.5)
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.left.color).to eq(OoxmlParser::Color.new(0,0,0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.left.sz).to eq(0.5)
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.right.color).to eq(OoxmlParser::Color.new(0,0,0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.right.sz).to eq(0.5)
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.top.color).to eq(OoxmlParser::Color.new(0,0,0))
    expect(docx.elements[1].rows.first.cells.first.elements.first.borders.top.sz).to eq(0.5)
  end

  it 'Table with background' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/tables/table_with_background.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].properties.shd).to eq(OoxmlParser::Color.new(255,0,0))
end
end




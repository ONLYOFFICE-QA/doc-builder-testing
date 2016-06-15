require 'bundler/setup'
require 'rspec'
require_relative '../../../../lib/doc_builder_testing'

describe 'Add table with cells margins' do
  it 'Table with cell margins: bottom, left, top' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/tables/table_with_cell_margins.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells[1].properties.margins.bottom).to eq(0.53)
    expect(docx.elements[1].rows.first.cells[1].properties.margins.left).to eq(0.18)
    expect(docx.elements[1].rows.first.cells[1].properties.margins.top).to eq(0.71)
  end
end

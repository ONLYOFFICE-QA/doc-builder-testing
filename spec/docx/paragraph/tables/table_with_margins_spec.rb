require 'bundler/setup'
require 'rspec'
require_relative '../../../../lib/doc_builder_testing'

describe 'Add table with margins' do

  it 'Table with margins: bottom, top, left, right' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/tables/table_with_margins.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.first.properties.margins.bottom).to eq(0.127)
    expect(docx.elements[1].rows.first.cells.first.properties.margins.top).to eq(0.127)
    expect(docx.elements[1].rows.first.cells.first.properties.margins.left).to eq(0.254)
    expect(docx.elements[1].rows.first.cells.first.properties.margins.right).to eq(0.254)
  end
end




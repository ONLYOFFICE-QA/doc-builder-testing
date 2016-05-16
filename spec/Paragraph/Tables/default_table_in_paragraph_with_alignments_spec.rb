require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'

describe 'Add deafult table with alignments' do

  it 'Table with center alignment' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/Paragraph/Tables/default_table_in_paragraph_center.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].properties.jc).to eq(:center)
  end

  it 'Table with left alignment' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/Paragraph/Tables/default_table_in_paragraph_left.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].properties.jc).to eq(:left)
  end

  it 'Table with right alignment' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/Paragraph/Tables/default_table_in_paragraph_right.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.length).to eq(3)
    expect(docx.elements[1].properties.jc).to eq(:right)
  end
end




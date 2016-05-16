require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'

describe 'Add deafult table in header' do

  it 'Default table in footer ' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/Header/Tables/add_table_in_header.js')

    expect(docx.notes.first.elements[1].rows.length).to eq(3)
  end

  it 'Table with right alignment' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/Header/Tables/add_table_in_header_right.js')
    expect(docx.notes.first.elements[1].rows.length).to eq(3)
    expect(docx.notes.first.elements[1].properties.jc).to eq(:right)

  end
end




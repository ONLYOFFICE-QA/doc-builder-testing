require 'bundler/setup'
require 'rspec'
require_relative '../../../../lib/doc_builder_testing'

describe 'Add table with merge' do

  it 'Table with merge: 2:3 x 2x3' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/tables/table_with_merge.js')
    expect(docx.elements[1].rows.length).to eq(5)
    expect(docx.elements[1].rows[1].cells[1].elements.first.character_style_array[1].text).to eq('Merged cell')
    expect(docx.elements[1].rows[1].cells[1].properties.merge.count_of_merged_cells).to eq(2)
    expect(docx.elements[1].rows[1].cells[1].properties.merge.type).to eq('horizontal')
    expect(docx.elements[1].rows[1].cells[1].properties.merge.value).to eq('2')
  end
end




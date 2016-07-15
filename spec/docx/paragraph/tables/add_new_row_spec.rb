require 'spec_helper'

describe 'Add new row in table' do
  it 'Add new row in position' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/tables/table_add_row_in_position.js')
    expect(docx.elements[1].rows.length).to eq(4)
    expect(docx.elements[1].rows[1].cells.first.elements.first.character_style_array[1].text).to eq('NewRow')
  end

  it 'Add new row without position' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/tables/table_add_row_without_position.js')
    expect(docx.elements[1].rows.length).to eq(4)
    expect(docx.elements[1].rows[3].cells.first.elements.first.character_style_array[1].text).to eq('NewRow')
  end
end

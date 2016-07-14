require 'bundler/setup'
require 'rspec'
require_relative '../../../../lib/doc_builder_testing'

describe 'Add tables with different text direction' do
  it 'Table with text direction: Left To Right' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/tables/table_with_textdirection_ltr.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows[2].cells.first.elements.first.character_style_array[1].text).to eq('left to right')
    expect(docx.elements[1].rows[2].cells.first.properties.text_direction).to eq(:horizontal)
  end

  it 'Table with text direction: Top To Bottom' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/tables/table_with_textdirection_ttb.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows[2].cells.first.elements.first.character_style_array[1].text).to eq('top to bottom')
    expect(docx.elements[1].rows[2].cells.first.properties.text_direction).to eq(:horizontal)
  end

  it 'Table with text direction: Right To Left' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/tables/table_with_textdirection_rtl.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows[2].cells[1].elements.first.character_style_array[1].text).to eq('right to left')
    expect(docx.elements[1].rows[2].cells[1].properties.text_direction).to eq(:rotate_on_90)
  end

  it 'Table with text direction: Bottom To Top' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/tables/table_with_textdirection_btt.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows[2].cells[2].elements.first.character_style_array[1].text).to eq('bottom to top')
    expect(docx.elements[1].rows[2].cells[2].properties.text_direction).to eq(:rotate_on_270)
  end
end

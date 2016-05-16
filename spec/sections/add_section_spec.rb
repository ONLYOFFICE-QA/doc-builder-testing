require 'bundler/setup'
require 'rspec'
require_relative '../../lib/doc_builder_testing'

describe 'text with tabs' do

  it 'Add text in Section' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/sections/add_text_in_section.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('First Page')
    expect(docx.elements.last.character_style_array.first.text).to eq('Second Page')
  end

  it 'Add Table in Section' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/sections/add_table_in_section.js')
    expect(docx.element_by_description[1].rows.length).to eq(3)
    expect(docx.element_by_description[1].rows[0].cells.length).to eq(3)
    expect(docx.element_by_description[4].rows.length).to eq(3)
    expect(docx.element_by_description[4].rows[0].cells.length).to eq(3)
  end

  it 'Page size for Section' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/sections/page_size_for_section.js')
    expect(docx.page_properties.size.name).to eq('US Letter')
    expect(docx.elements[1].sector_properties.size.name).to eq('A4')
  end
end
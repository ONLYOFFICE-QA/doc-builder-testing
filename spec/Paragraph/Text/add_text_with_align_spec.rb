require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'

describe 'Check aligns' do

  it 'Align should be left' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/Paragraph/Text/add_text_with_align_left.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Left')
    expect(docx.elements[1].align).to eq(:left)
  end

  it 'Align should be right' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/Paragraph/Text/add_text_with_align_right.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Right')
    expect(docx.elements[1].align).to eq(:right)
  end

  it 'Align should be center' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/Paragraph/Text/add_text_with_align_center.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Center')
    expect(docx.elements[1].align).to eq(:center)
  end
end

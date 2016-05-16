require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'

describe 'Check indents' do

  it 'Indent should be left' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/Paragraph/Text/add_text_with_indentleft.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('LeftIndent')
    expect(docx.elements[1].ind.left_indent).to eq(2.65)
  end

  it 'Indent should be right' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/Paragraph/Text/add_text_with_indentright.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('RightIndent')
    expect(docx.elements[1].ind.right_indent).to eq(1.76)
  end
end

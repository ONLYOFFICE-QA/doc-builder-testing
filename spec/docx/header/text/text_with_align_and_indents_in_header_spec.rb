require 'bundler/setup'
require 'rspec'
require_relative '../../../../lib/doc_builder_testing'

describe 'Check indents' do
  it 'Align should be right' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/header/text/text_in_right_in_header.js')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('Right')
    expect(docx.notes.first.elements[1].align).to eq(:right)
  end

  it 'Align should be center' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/header/text/text_in_center_in_header.js')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('Center')
    expect(docx.notes.first.elements[1].align).to eq(:center)
  end

  it 'Indent should be left' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/header/text/text_leftindent_in_header.js')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('LeftIndent')
    expect(docx.notes.first.elements[1].ind.left_indent).to eq(2.65)
  end

  it 'Indent should be right' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/header/text/text_rightindent_in_header.js')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('RightIndent')
    expect(docx.notes.first.elements[1].ind.right_indent).to eq(1.76)
  end
end

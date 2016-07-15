require 'spec_helper'

describe 'Check aligns' do
  it 'Align should be left' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_align_left.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('paragraph align: left')
    expect(docx.elements[1].align).to eq(:left)
  end

  it 'Align should be right' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_align_right.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('paragraph align: right')
    expect(docx.elements[1].align).to eq(:right)
  end

  it 'Align should be center' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_align_center.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('paragraph align: center')
    expect(docx.elements[1].align).to eq(:center)
  end
end

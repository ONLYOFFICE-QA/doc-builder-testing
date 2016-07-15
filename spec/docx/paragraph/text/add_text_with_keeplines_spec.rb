require 'spec_helper'

describe 'Check keeplines' do
  it 'Keeplines' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_keeplines.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('KeepLines')
    expect(docx.elements[1].keep_lines).to eq(true)
  end

  it 'Keepnext' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_keepnext.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('KeepNext')
    expect(docx.elements[1].keep_next).to eq(true)
  end
end

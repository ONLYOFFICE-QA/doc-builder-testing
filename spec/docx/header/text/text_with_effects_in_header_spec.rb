require 'spec_helper'

describe 'text with effects' do
  it 'text shopuld be doublestrikeout' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/header/text/text_with_doublestrikeout_in_header.js')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('DoubleStrikeout')
    expect(docx.notes.first.elements[1].character_style_array.first.font_style.strike).to eq(:double)
  end

  it 'text should be capitals' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/header/text/text_with_capitals_in_header.js')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('Capitals')
    expect(docx.notes.first.elements[1].character_style_array.first.caps).to eq(:caps)
  end

  it 'text should be subscript' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/header/text/text_with_subscript_in_header.js')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('Subscript')
    expect(docx.notes.first.elements[1].character_style_array.first.vertical_align).to eq(:subscript)
  end

  it 'text should be subscript' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/header/text/text_with_superscript_in_header.js')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('Superscript')
    expect(docx.notes.first.elements[1].character_style_array.first.vertical_align).to eq(:superscript)
  end
end

require 'spec_helper'

describe 'text with effects' do
  it 'text shopuld be doublestrikeout' do
    docx = builder.build_doc_and_parse('asserts/js/docx/header/text/text_with_doublestrikeout_in_header.js')
    expect(docx.notes.first.elements[1].nonempty_runs.first.text).to eq('DoubleStrikeout')
    expect(docx.notes.first.elements[1].nonempty_runs.first.font_style.strike).to eq(:double)
  end

  it 'text should be capitals' do
    docx = builder.build_doc_and_parse('asserts/js/docx/header/text/text_with_capitals_in_header.js')
    expect(docx.notes.first.elements[1].nonempty_runs.first.text).to eq('Capitals')
    expect(docx.notes.first.elements[1].nonempty_runs.first.caps).to eq(:caps)
  end

  it 'text should be subscript' do
    docx = builder.build_doc_and_parse('asserts/js/docx/header/text/text_with_subscript_in_header.js')
    expect(docx.notes.first.elements[1].nonempty_runs.first.text).to eq('Subscript')
    expect(docx.notes.first.elements[1].nonempty_runs.first.vertical_align).to eq(:subscript)
  end

  it 'text should be subscript' do
    docx = builder.build_doc_and_parse('asserts/js/docx/header/text/text_with_superscript_in_header.js')
    expect(docx.notes.first.elements[1].nonempty_runs.first.text).to eq('Superscript')
    expect(docx.notes.first.elements[1].nonempty_runs.first.vertical_align).to eq(:superscript)
  end
end

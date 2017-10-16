require 'spec_helper'

describe 'My behaviour' do
  it 'text should be smallcapitals' do
    docx = builder.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_smallcapitals_in_paragraph.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('SmallCapitals')
    expect(docx.elements[1].nonempty_runs.first.caps).to eq(:small_caps)
  end

  it 'text shopuld be doublestrikeout' do
    docx = builder.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_doublestrikeout_in_paragraph.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('DoubleStrikeout')
    expect(docx.elements[1].nonempty_runs.first.font_style.strike).to eq(:double)
  end

  it 'text should be capitals' do
    docx = builder.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_capitals_in_paragraph.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Capitals')
    expect(docx.elements[1].nonempty_runs.first.caps).to eq(:caps)
  end

  it 'text should be subscript' do
    docx = builder.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_subscript_in_paragraph.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Subscript')
    expect(docx.elements[1].nonempty_runs.first.vertical_align).to eq(:subscript)
  end

  it 'text should be subscript' do
    docx = builder.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_superscript_in_paragraph.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Superscript')
    expect(docx.elements[1].nonempty_runs.first.vertical_align).to eq(:superscript)
  end
end

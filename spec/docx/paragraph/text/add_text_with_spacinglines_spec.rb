require 'spec_helper'

describe 'Check spacinglines' do
  it 'SpacingLine should be auto: 3' do
    docx = builder.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_spacingline_auto.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Auto:3')
    expect(docx.elements[1].spacing.line).to eq(3)
  end

  it 'SpacingLine should be exact: 10pt' do
    docx = builder.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_spacingline_exact.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Exact:10pt')
    expect(docx.elements[1].spacing.line).to eq(0.35)
    expect(docx.elements[1].spacing.line_rule).to eq(:exact)
  end

  it 'SpacingLine should be atleast: 20pt' do
    docx = builder.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_spacingline_atleast.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Atleast:20pt')
    expect(docx.elements[1].spacing.line).to eq(0.71)
    expect(docx.elements[1].spacing.line_rule).to eq(:at_least)
  end
end

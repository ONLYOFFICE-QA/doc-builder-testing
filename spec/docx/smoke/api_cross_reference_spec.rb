# frozen_string_literal: true

require 'spec_helper'
describe 'Cross-Reference test' do
  it 'ApiParagraph | AddNumberedCrossRef' do
    docx = builder.build_and_parse('js/docx/smoke/api_paragraph/add_numbered_cross_ref.js')
    expect(docx.elements[1].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[1].runs[2].instruction_text.value).to eq(' PAGEREF _Ref1 \\h')
    expect(docx.elements[2].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[2].runs[2].instruction_text.value).to eq(' REF _Ref1 \\r  \\h')
    expect(docx.elements[3].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[3].runs[2].instruction_text.value).to eq(' REF _Ref1 \\n  \\h')
    expect(docx.elements[4].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[4].runs[2].instruction_text.value).to eq(' REF _Ref1 \\w  \\h \\d  ')
    expect(docx.elements[5].nonempty_runs[1].text).to eq('Numbered paragraph lvl 1')
    expect(docx.elements[5].runs[2].instruction_text.value).to eq(' REF _Ref1  \\h')
    expect(docx.elements[6].nonempty_runs[1].text).to eq('above')
    expect(docx.elements[6].runs[2].instruction_text.value).to eq(' REF _Ref1 \\p  \\h')
  end
end

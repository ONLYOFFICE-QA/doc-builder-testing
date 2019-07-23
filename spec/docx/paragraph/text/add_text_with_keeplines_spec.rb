# frozen_string_literal: true

require 'spec_helper'

describe 'Check keeplines' do
  it 'Keeplines' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/text/add_text_with_keeplines.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('KeepLines')
    expect(docx.elements[1].keep_lines).to eq(true)
  end

  it 'Keepnext' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/text/add_text_with_keepnext.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('KeepNext')
    expect(docx.elements[1].keep_next).to eq(true)
  end
end

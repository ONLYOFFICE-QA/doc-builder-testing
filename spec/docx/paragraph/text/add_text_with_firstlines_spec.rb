# frozen_string_literal: true

require 'spec_helper'

describe 'Check firstline' do
  it 'Firstline should be 0.18' do
    docx = builder.build_and_parse('js/docx/paragraph/text/add_text_with_firstline_plus.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('First line indent is 5pt')
    expect(docx.elements[1].ind.first_line_indent).to eq(OoxmlParser::OoxmlSize.new(0.18, :centimeter))
  end

  it 'Firstline should be 0' do
    docx = builder.build_and_parse('js/docx/paragraph/text/add_text_with_firstline_minus.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('First line indent is 5pt')
    expect(docx.elements[1].ind.first_line_indent).to eq(OoxmlParser::OoxmlSize.new(0, :centimeter))
  end
end

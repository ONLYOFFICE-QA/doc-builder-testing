require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'

describe 'Check firstline' do

  it 'Firstline should be 0.18' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/paragraph/text/add_text_with_firstline_plus.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('First line indent is 5pt')
    expect(docx.elements[1].ind.first_line_indent).to eq(0.18)
  end

  it 'Firstline should be 0' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/paragraph/text/add_text_with_firstline_minus.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('First line indent is 5pt')
    expect(docx.elements[1].ind.first_line_indent).to eq(0)
  end
end

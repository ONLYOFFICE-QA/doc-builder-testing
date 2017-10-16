require 'spec_helper'

describe 'Check indents' do
  it 'Indent should be left' do
    docx = builder.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_indentleft.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('LeftIndent')
    expect(docx.elements[1].ind.left_indent).to eq(OoxmlParser::OoxmlSize.new(2.65, :centimeter))
  end

  it 'Indent should be right' do
    docx = builder.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_indentright.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('RightIndent')
    expect(docx.elements[1].ind.right_indent).to eq(OoxmlParser::OoxmlSize.new(1.76, :centimeter))
  end
end

require 'spec_helper'

describe 'Check spacinglines' do
  it 'SpacingLine should be auto: 3' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_spacingline_auto.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Auto:3')
    expect(docx.elements[1].paragraph_properties.spacing.line).to eq(OoxmlParser::OoxmlSize.new(3, :centimeter))
  end

  it 'SpacingLine should be exact: 10pt' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_spacingline_exact.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Exact:10pt')
    expect(docx.elements[1].paragraph_properties.spacing.line).to eq(OoxmlParser::OoxmlSize.new(0.35, :centimeter))
    expect(docx.elements[1].paragraph_properties.spacing.line_rule).to eq(:exact)
  end

  it 'SpacingLine should be atleast: 20pt' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_spacingline_atleast.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Atleast:20pt')
    expect(docx.elements[1].paragraph_properties.spacing.line).to eq(OoxmlParser::OoxmlSize.new(0.71, :centimeter))
    expect(docx.elements[1].paragraph_properties.spacing.line_rule).to eq(:at_least)
  end
end

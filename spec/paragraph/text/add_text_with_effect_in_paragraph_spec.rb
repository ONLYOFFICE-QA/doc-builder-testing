require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'

describe 'My behaviour' do
  it 'text should be smallcapitals' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/paragraph/text/add_text_with_smallcapitals_in_paragraph.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('SmallCapitals')
    expect(docx.elements[1].character_style_array.first.caps).to eq(:small_caps)
  end

  it 'text shopuld be doublestrikeout' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/paragraph/text/add_text_with_doublestrikeout_in_paragraph.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('DoubleStrikeout')
    expect(docx.elements[1].character_style_array.first.font_style.strike).to eq(:double)
  end

  it 'text should be capitals' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/paragraph/text/add_text_with_capitals_in_paragraph.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Capitals')
    expect(docx.elements[1].character_style_array.first.caps).to eq(:caps)
  end

  it 'text should be subscript' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/paragraph/text/add_text_with_subscript_in_paragraph.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Subscript')
    expect(docx.elements[1].character_style_array.first.vertical_align).to eq(:subscript)
  end

  it 'text should be subscript' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/paragraph/text/add_text_with_superscript_in_paragraph.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Superscript')
    expect(docx.elements[1].character_style_array.first.vertical_align).to eq(:superscript)
  end

end




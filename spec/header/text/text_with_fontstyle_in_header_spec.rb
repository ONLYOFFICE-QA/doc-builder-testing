require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'

describe 'Check fontstyles in header' do

  it 'text should be bold' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/header/text/text_with_bold_in_header.js')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('Bold')
    expect(docx.notes.first.elements[1].character_style_array.first.font_style.bold).to be_truthy
  end

  it 'text should be italic' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/header/text/text_with_italic_in_header.js')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('Italic')
    expect(docx.notes.first.elements[1].character_style_array.first.font_style.italic).to be_truthy
  end

  it 'text shopuld be strikeout' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/header/text/text_with_strikeout_in_header.js')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('Strikeout')
    expect(docx.notes.first.elements[1].character_style_array.first.font_style.strike).to eq(:single)
  end

  it 'text should be underline' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/header/text/text_with_underline_in_header.js')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('Underline')
    expect(docx.notes.first.elements[1].character_style_array.first.font_style.underlined.style).to eq('single')
  end
end

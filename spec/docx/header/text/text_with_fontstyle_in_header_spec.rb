# frozen_string_literal: true

require 'spec_helper'

describe 'Check fontstyles in header' do
  it 'text should be bold' do
    docx = builder.build_and_parse('asserts/js/docx/header/text/text_with_bold_in_header.js')
    expect(docx.notes.first.elements[1].nonempty_runs.first.text).to eq('Bold')
    expect(docx.notes.first.elements[1].nonempty_runs.first.font_style.bold).to be_truthy
  end

  it 'text should be italic' do
    docx = builder.build_and_parse('asserts/js/docx/header/text/text_with_italic_in_header.js')
    expect(docx.notes.first.elements[1].nonempty_runs.first.text).to eq('Italic')
    expect(docx.notes.first.elements[1].nonempty_runs.first.font_style.italic).to be_truthy
  end

  it 'text shopuld be strikeout' do
    docx = builder.build_and_parse('asserts/js/docx/header/text/text_with_strikeout_in_header.js')
    expect(docx.notes.first.elements[1].nonempty_runs.first.text).to eq('Strikeout')
    expect(docx.notes.first.elements[1].nonempty_runs.first.font_style.strike).to eq(:single)
  end

  it 'text should be underline' do
    docx = builder.build_and_parse('asserts/js/docx/header/text/text_with_underline_in_header.js')
    expect(docx.notes.first.elements[1].nonempty_runs.first.text).to eq('Underline')
    expect(docx.notes.first.elements[1].nonempty_runs.first.font_style.underlined.style).to eq('single')
  end
end

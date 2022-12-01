# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRange Font Format' do
  it 'ApiRange | SetBold method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_bold.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('Bold text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.bold).to be_truthy
  end

  it 'ApiRange | Bold method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/setter_bold.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('Bold text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.bold).to be_truthy
  end

  it 'ApiRange | SetItalic method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_italic.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('Italicized text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.italic).to be_truthy
  end

  it 'ApiRange | Italic method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/setter_italic.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('Italicized text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.italic).to be_truthy
  end

  it 'ApiRange | SetUnderline method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_underline.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('The text underlined with a single line')
    expect(xlsx.worksheets.first.rows[3].cells[0].raw_text).to eq('Normal text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.underlined).to eq(:single)
    expect(xlsx.worksheets.first.rows[3].cells[0].style.font.font_style.underlined).to eq(:none)
  end

  it 'ApiRange | Underline method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/setter_underline.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('The text underlined with a single line')
    expect(xlsx.worksheets.first.rows[3].cells[0].raw_text).to eq('Normal text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.underlined).to eq(:single)
    expect(xlsx.worksheets.first.rows[3].cells[0].style.font.font_style.underlined).to eq(:none)
  end

  it 'ApiRange | SetStrikeout method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_strikeout.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('Struckout text')
    expect(xlsx.worksheets.first.rows[2].cells[0].raw_text).to eq('Normal text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.strike).to eq(:single)
    expect(xlsx.worksheets.first.rows[2].cells[0].style.font.font_style.strike).to eq(:none)
  end
end

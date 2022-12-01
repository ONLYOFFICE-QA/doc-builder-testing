# frozen_string_literal: true

require 'spec_helper'

describe 'ApiRange Color' do
  it 'ApiRange | SetFontColor method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_font_color.js')
    expect(xlsx.worksheets.first.rows[1]
               .cells.first.style
               .font.color.rgb).to eq(OoxmlParser::Color.new(49, 133, 154))
    expect(xlsx.worksheets.first.rows[3]
               .cells.first.style
               .font.color.theme).to eq(1)
  end

  it 'ApiRange | FontColor method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/setter_font_color.js')
    expect(xlsx.worksheets.first.rows[1]
               .cells.first.style
               .font.color.rgb).to eq(OoxmlParser::Color.new(49, 133, 154))
    expect(xlsx.worksheets.first.rows[3]
               .cells.first.style
               .font.color.theme).to eq(1)
  end

  it 'ApiRange | SetFillColor method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_fill_color.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.fill_color.pattern_fill.background_color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.rows[1].cells[0].style.fill_color.pattern_fill.foreground_color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('This is the cell with a color set to its background')
    expect(xlsx.worksheets.first.rows[3].cells[0].style.fill_color).to be_nil
    expect(xlsx.worksheets.first.rows[3].cells[0].raw_text).to eq('This is the cell with a default background color')
  end

  it 'ApiRange | FillColor method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/setter_fill_color.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.fill_color.pattern_fill.background_color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.rows[1].cells[0].style.fill_color.pattern_fill.foreground_color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('This is the cell with a color set to its background')
    expect(xlsx.worksheets.first.rows[3].cells[0].style.fill_color).to be_nil
    expect(xlsx.worksheets.first.rows[3].cells[0].raw_text).to eq('This is the cell with a default background color')
  end
end

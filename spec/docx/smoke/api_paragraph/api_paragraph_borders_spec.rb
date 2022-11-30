# frozen_string_literal: true

require 'spec_helper'
describe 'ApiParagraph Borders' do
  it 'ApiParagraph | SetBetweenBorder method' do
    docx = builder.build_and_parse('js/docx/smoke/api_paragraph/set_between_border.js')
    expect(docx.elements.first.borders.between.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.borders.between.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements.first.borders.between.size).to eq(OoxmlParser::OoxmlSize.new(24, :one_eighth_point))
    expect(docx.elements[1].borders.between.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements[1].borders.between.space).to eq(OoxmlParser::OoxmlSize.new(10, :point))
    expect(docx.elements[1].borders.between.size).to eq(OoxmlParser::OoxmlSize.new(12, :one_eighth_point))
  end

  it 'ApiParagraph | SetBottomBorder method' do
    docx = builder.build_and_parse('js/docx/smoke/api_paragraph/set_bottom_border.js')
    expect(docx.elements.first.borders.bottom.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements.first.borders.bottom.size).to eq(OoxmlParser::OoxmlSize.new(8, :one_eighth_point))
    expect(docx.elements.first.borders.bottom.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiParagraph | SetLeftBorder method' do
    docx = builder.build_and_parse('js/docx/smoke/api_paragraph/set_left_border.js')
    expect(docx.elements.first.borders.left.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.borders.left.val).to eq(:single)
    expect(docx.elements.first.borders.left.space).to eq(OoxmlParser::OoxmlSize.new(8, :point))
    expect(docx.elements.first.borders.left.size).to eq(OoxmlParser::OoxmlSize.new(16, :one_eighth_point))
  end

  it 'ApiParagraph | SetRightBorder method' do
    docx = builder.build_and_parse('js/docx/smoke/api_paragraph/set_right_border.js')
    expect(docx.elements.first.borders.right.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements.first.borders.right.val).to eq(:single)
    expect(docx.elements.first.borders.right.space).to eq(OoxmlParser::OoxmlSize.new(8, :point))
    expect(docx.elements.first.borders.right.size).to eq(OoxmlParser::OoxmlSize.new(16, :one_eighth_point))
  end

  it 'ApiParagraph | SetTopBorder method' do
    docx = builder.build_and_parse('js/docx/smoke/api_paragraph/set_top_border.js')
    expect(docx.elements.first.borders.top.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.borders.top.size).to eq(OoxmlParser::OoxmlSize.new(24, :one_eighth_point))
    expect(docx.elements.first.borders.top.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end
end

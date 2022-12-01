# frozen_string_literal: true

require 'spec_helper'
describe 'ApiParaPr section tests' do
  it 'ApiParaPr | GetClassType method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_para_pr/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.last.characters.first.text).to eq('Class Type = paraPr')
  end

  it 'ApiParaPr | SetBullet method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_para_pr/set_bullet.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.numbering.symbol).to eq('-')
  end

  it 'ApiParaPr | SetIndFirstLine method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_para_pr/set_ind_first_line.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.indent).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParaPr | SetIndLeft method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_para_pr/set_ind_left.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.margin_left).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end

  it 'ApiParaPr | SetIndRight method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_para_pr/set_ind_right.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.margin_right).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end

  it 'ApiParaPr | SetJc method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_para_pr/set_jc.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.align).to eq(:center)
  end

  it 'ApiParaPr | SetSpacingAfter method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_para_pr/set_spacing_after.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.spacing.after).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParaPr | SetSpacingBefore method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_para_pr/set_spacing_before.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.last.properties.spacing.before).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParaPr | SetSpacingLine method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_para_pr/set_spacing_line.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.spacing.line).to eq(OoxmlParser::OoxmlSize.new(300, :percent))
  end

  it 'ApiParaPr | SetTabs method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_para_pr/set_tabs.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.tabs[0].align).to eq(:left)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.tabs[0].position).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.tabs[1].align).to eq(:center)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.tabs[1].position).to eq(OoxmlParser::OoxmlSize.new(4320, :twip))
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.tabs[2].align).to eq(:right)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.tabs[2].position).to eq(OoxmlParser::OoxmlSize.new(7200, :twip))
  end
end

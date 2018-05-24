require 'spec_helper'
describe 'ApiParaPr section tests' do
  it 'ApiParaPr | GetClassType method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_para_pr/get_class_type.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[1].runs.first.text).to eq('Class Type = paraPr')
  end

  it 'ApiParaPr | SetBullet method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_bullet.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.numbering.symbol).to eq('-')
  end

  it 'ApiParaPr | SetIndFirstLine method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_ind_first_line.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.indent).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParaPr | SetIndLeft method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_ind_left.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.margin_left).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end

  it 'ApiParaPr | SetIndRight method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_ind_right.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.margin_right).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end

  it 'ApiParaPr | SetJc method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_jc.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.align).to eq(:center)
  end

  it 'ApiParaPr | SetSpacingAfter method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_spacing_after.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.spacing.after).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParaPr | SetSpacingBefore method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_spacing_before.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[1].properties.spacing.before).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParaPr | SetSpacingLine method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_spacing_line.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.spacing.line).to eq(OoxmlParser::OoxmlSize.new(300_000.0, :one_1000th_percent))
  end

  it 'ApiParaPr | SetTabs method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_para_pr/set_tabs.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.tabs.tabs_array.first.position.to_unit(:twip)).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.tabs.tabs_array.first.value).to eq(:left)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.tabs.tabs_array[1].position.to_unit(:twip)).to eq(OoxmlParser::OoxmlSize.new(4320, :twip))
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.tabs.tabs_array[1].value).to eq(:center)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.tabs.tabs_array[2].position.to_unit(:twip)).to eq(OoxmlParser::OoxmlSize.new(7200, :twip))
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.tabs.tabs_array[2].value).to eq(:right)
  end
end

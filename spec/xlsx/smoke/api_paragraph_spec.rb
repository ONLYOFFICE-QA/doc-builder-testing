# frozen_string_literal: true

require 'spec_helper'
describe 'ApiParagraph section tests' do
  it 'ApiParagraph | AddElement method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/add_element.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.first.text).to eq('This is the text for a text run. Nothing special.')
  end

  it 'ApiParagraph | AddLineBreak method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/add_line_break.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.size).to eq(2)
  end

  it 'ApiParagraph | AddTabStop method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/add_tab_stop.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.size).to eq(5)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.first.text).to eq('This is just a sample text. After it three tab stops will be added.')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].text).to eq("\t")
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[2].text).to eq("\t")
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[3].text).to eq("\t")
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[4].text).to eq('This is the text which starts after the tab stops.')
  end

  it 'ApiParagraph | AddText method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/add_text.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.first.text).to eq('This is a text inside the shape aligned left.')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].text).to eq('This is a text after the line break.')
  end

  it 'ApiParagraph | GetClassType method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/get_class_type.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.first.text).to eq('Class Type = paragraph')
  end

  it 'ApiParagraph | GetElement method' do
    skip if builder.semver < Semantic::Version.new('5.3.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/get_element.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.size).to eq(3)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[0].properties.font_style.bold).to be true
  end

  it 'ApiParagraph | GetElementsCount method' do
    skip if builder.semver < Semantic::Version.new('5.3.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/get_elements_count.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.first.text).to eq("Number of paragraph elements at this point: \t1")
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[1].text).to eq("Number of paragraph elements after we added a text run: \t2")
  end

  it 'ApiParagraph | GetParaPr method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/get_para_pr.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.spacing.after).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParagraph | RemoveAllElements method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/remove_all_elements.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs.size).to eq(1)
  end

  it 'ApiParagraph | RemoveElement method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/remove_element.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs[2].text).not_to eq('This is the third paragraph element (it will be removed from the paragraph and we will not see it). ')
  end

  it 'ApiParagraph | SetBullet method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_bullet.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.numbering.symbol).to eq('-')
  end

  it 'ApiParagraph | SetIndFirstLine method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_ind_first_line.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.indent.to_unit(:twip)).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParagraph | SetIndLeft method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_ind_left.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.margin_left.to_unit(:twip)).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end

  it 'ApiParagraph | SetIndRight method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_ind_right.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.margin_right.to_unit(:twip)).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end

  it 'ApiParagraph | SetJc method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_jc.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.align).to eq(:center)
  end

  it 'ApiParagraph | SetSpacingAfter method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_spacing_after.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.spacing.after).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParagraph | SetSpacingBefore method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_spacing_before.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[1].properties.spacing.before).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParagraph | SetSpacingLine method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_spacing_line.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.spacing.line).to eq(OoxmlParser::OoxmlSize.new(200, :percent))
  end

  it 'ApiParagraph | SetTabs method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_paragraph/set_tabs.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.tabs.tabs_array.first.position.to_unit(:twip)).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.tabs.tabs_array.first.value).to eq(:left)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.tabs.tabs_array[1].position.to_unit(:twip)).to eq(OoxmlParser::OoxmlSize.new(4320, :twip))
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.tabs.tabs_array[1].value).to eq(:center)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.tabs.tabs_array[2].position.to_unit(:twip)).to eq(OoxmlParser::OoxmlSize.new(7200, :twip))
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.tabs.tabs_array[2].value).to eq(:right)
  end
end

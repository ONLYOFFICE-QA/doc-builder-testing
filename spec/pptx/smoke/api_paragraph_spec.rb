require 'spec_helper'
describe 'ApiParagraph section tests' do
  it 'ApiParagraph | AddElement method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/add_element.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.last.characters.first.text).to eq('This is the text for a text run. Nothing special.')
  end

  it 'ApiParagraph | AddLineBreak method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/add_line_break.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.size).to eq(2)
  end

  it 'ApiParagraph | AddTabStop method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/add_tab_stop.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.size).to eq(5)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq('This is just a sample text. After it three tab stops will be added.')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs[1].text).to eq("\t")
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs[2].text).to eq("\t")
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs[3].text).to eq("\t")
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs[4].text).to eq('This is the text which starts after the tab stops.')
  end

  it 'ApiParagraph | AddText method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/add_text.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq('This is a text inside the shape aligned left.')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.text).to eq('This is a text after the line break.')
  end

  it 'ApiParagraph | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.last.characters.first.text).to eq('Class Type = paragraph')
  end

  it 'ApiParagraph | GetElement method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/get_element.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.size).to eq(3)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs[1].properties.font_style.bold).to be true
  end

  it 'ApiParagraph | GetElementsCount method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/get_elements_count.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq("Number of paragraph elements at this point: \t0")
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.last.text).to eq("Number of paragraph elements after we added a text run: \t1")
  end

  it 'ApiParagraph | GetParaPr method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/get_para_pr.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.spacing.after).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParagraph | RemoveAllElements method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/remove_all_elements.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.size).to eq(1)
  end

  it 'ApiParagraph | RemoveElement method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/remove_element.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs[2].text).not_to eq('This is the third paragraph element (it will be removed from the paragraph and we will not see it). ')
  end

  it 'ApiParagraph | SetBullet method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_bullet.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.numbering.symbol).to eq('-')
  end

  it 'ApiParagraph | SetIndFirstLine method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_ind_first_line.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.indent).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParagraph | SetIndLeft method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_ind_left.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.margin_left).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end

  it 'ApiParagraph | SetIndRight method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_ind_right.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.margin_right).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end

  it 'ApiParagraph | SetJc method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_jc.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.align).to eq(:center)
    expect(pptx.slides.first.elements.first.text_body.paragraphs[1].properties.align).to eq(:right)
    expect(pptx.slides.first.elements.first.text_body.paragraphs[2].properties.align).to eq(:left)
  end

  it 'ApiParagraph | SetSpacingAfter method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_spacing_after.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.spacing.after).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParagraph | SetSpacingBefore method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_spacing_before.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.last.properties.spacing.before).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParagraph | SetSpacingLine method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_spacing_line.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.spacing.line).to eq(OoxmlParser::OoxmlSize.new(3 * 240, :one_1000th_percent))
  end

  it 'ApiParagraph | SetTabs method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_paragraph/set_tabs.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.tabs[0].align).to eq(:left)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.tabs[0].position).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.tabs[1].align).to eq(:center)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.tabs[1].position).to eq(OoxmlParser::OoxmlSize.new(4320, :twip))
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.tabs[2].align).to eq(:right)
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.tabs[2].position).to eq(OoxmlParser::OoxmlSize.new(7200, :twip))
  end
end

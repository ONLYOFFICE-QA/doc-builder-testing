# frozen_string_literal: true

require 'spec_helper'
describe 'ApiParagraph section tests' do
  it 'ApiParagraph | AddColumnBreak method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/add_column_break.js')
    expect(docx.page_properties.columns.count).to eq(2)
    expect(docx.elements.first.nonempty_runs[0].text).to eq('This is the text for the first column. It is written all in one text run. Nothing special.')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('This is the text which starts from the beginning of the second column. ')
    expect(docx.elements.first.nonempty_runs[3].text).to eq('It is written in two text runs, you need a space at the end of the first run sentence to separate them.')
  end

  it 'ApiParagraph | AddDrawing method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/add_drawing.js')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.type).to eq(:chart)
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.axises.first.title.elements.first.runs.first.text).to eq('Year')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.axises.first.title.elements.first.runs.first.properties.font_size).to eq(11.0)
    points = docx.elements.first.nonempty_runs.first
                 .drawings.first.graphic.data.series[0]
                 .values.number_reference.cache.points
    expect(points[0].value.value).to eq('200')
    expect(points[1].value.value).to eq('240')
    expect(points[2].value.value).to eq('280')

    points2 = docx.elements.first.nonempty_runs.first
                  .drawings.first.graphic.data.series[1]
                  .values.number_reference.cache.points

    expect(points2[0].value.value).to eq('250')
    expect(points2[1].value.value).to eq('260')
    expect(points2[2].value.value).to eq('280')

    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.series.first.text.string.cache.points.first.value.value).to eq('Projected Revenue')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.series[1].text.string.cache.points.first.value.value).to eq('Estimated Costs')

    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.series.first.categories.string.cache.points.first.value.value).to eq('2014')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.series.first.categories.string.cache.points[1].value.value).to eq('2015')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.series.first.categories.string.cache.points[2].value.value).to eq('2016')
  end

  it 'ApiParagraph | AddElement method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/add_element.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is the text for a text run. Nothing special.')
  end

  it 'ApiParagraph | AddLineBreak method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/add_line_break.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('This is the text for the first line. Nothing special.')
    expect(docx.elements.first.nonempty_runs[1].text).to eq("\r")
    expect(docx.elements.first.nonempty_runs[2].text).to eq('This is the text which starts from the beginning of the second line. ')
    expect(docx.elements.first.nonempty_runs[3].text).to eq('It is written in two text runs, you need a space at the end of the first run sentence to separate them.')
  end

  it 'ApiParagraph | AddPageBreak method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/add_page_break.js')
    nonempty_runs = docx.elements.first.nonempty_runs
    expect(nonempty_runs[0].text).to eq('This is the text for the first page. After it a page break will be added. Scroll down to the second page to see the text there.')
    expect(nonempty_runs[2].text).to eq('This is the text which starts from the beginning of the second page. ')
    expect(nonempty_runs[3].text).to eq('It is written in two text runs, you need a space at the end of the first run sentence to separate them.')
  end

  it 'ApiParagraph | AddPageNumber method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/add_page_number.js')
    expect(docx.notes[0].elements.first.field_simple).to be_page_numbering
    expect(docx.notes[1].elements.first.field_simple).to be_page_numbering
  end

  it 'ApiParagraph | AddPagesCount method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/add_pages_count.js')
    expect(docx.notes[0].elements.first.field_simple
               .instruction).to eq('NUMPAGES \* MERGEFORMAT')
  end

  it 'ApiParagraph | AddTabStop method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/add_tab_stop.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('This is just a sample text. After it three tab stops will be added.')
    expect(docx.elements.first.nonempty_runs[1].text).to eq("\t")
    expect(docx.elements.first.nonempty_runs[2].text).to eq("\t")
    expect(docx.elements.first.nonempty_runs[3].text).to eq("\t")
    expect(docx.elements.first.nonempty_runs[4].text).to eq('This is the text which starts after the tab stops.')
  end

  it 'ApiParagraph | AddText method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/add_text.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is just a sample text. Nothing special.')
  end

  it 'ApiParagraph | GetClassType method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/get_class_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = paragraph')
  end

  it 'ApiParagraph | GetElement method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/get_element.js')
    runs = docx.elements.last.nonempty_runs
    expect(runs[0].text).to eq('This is the text for the first text run. Do not forget a space at its end to separate from the second one. ')
    expect(runs[1].text).to eq('This is the text for the second run. We will set it bold afterwards. It also needs space at its end. ')
    expect(runs[2].text).to eq('This is the text for the third run. It ends the paragraph.')
    expect(runs[1].font_style.bold).to be_truthy
  end

  it 'ApiParagraph | GetElementsCount method' do
    skip if builder.semver < Semantic::Version.new('5.3.0')
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/get_elements_count.js')
    expect(docx.elements.first.nonempty_runs.first.text)
      .to eq('Number of paragraph elements at '\
             "this point: \t1\rNumber of paragraph "\
             "elements after we added a text run: \t2")
  end

  it 'ApiParagraph | GetNumbering method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/get_numbering.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is the first element of a numbered list')
    expect(docx.elements.first.numbering.numbering_properties).to eq(1)
    expect(docx.elements[1].nonempty_runs.first.text).to eq('This is the second element of a numbered list')
    expect(docx.elements[1].numbering.numbering_properties).to eq(1)
  end

  it 'ApiParagraph | GetParagraphMarkTextPr method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/get_paragraph_mark_text_pr.js')
    expect(docx.elements.first.paragraph_properties.run_properties.size.value).to eq(52)
    expect(docx.elements.first.paragraph_properties.run_properties.color).to eq(OoxmlParser::Color.new(255, 255, 0))
  end

  it 'ApiParagraph | GetParaPr method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/get_para_pr.js')
    expect(docx.elements.first.spacing.line).to eq(2)
    expect(docx.elements.first.ind.first_line_indent).to eq(OoxmlParser::OoxmlSize.new(1.27, :centimeter))
  end

  it 'ApiParagraph | RemoveAllElements method' do
    skip if builder.semver < Semantic::Version.new('5.3.0')
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/remove_all_elements.js')
    expect(docx.elements.first.nonempty_runs.first.text)
      .to eq('This is the first document paragraph. We removed all the elements '\
             'to get the number of paragraph elements at this point: 1. '\
             "If we had not done that the number before this sentence would be \'1\'.")
  end

  it 'ApiParagraph | RemoveElement method' do
    skip if builder.semver < Semantic::Version.new('5.3.0')
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/remove_element.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('This is the first paragraph element. ')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is the third paragraph element (it will be removed from the paragraph and we will not see it). ')
  end

  it 'ApiParagraph | SetBetweenBorder method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_between_border.js')
    expect(docx.elements.first.borders.between.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.borders.between.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements.first.borders.between.size).to eq(OoxmlParser::OoxmlSize.new(24, :one_eighth_point))
    expect(docx.elements[1].borders.between.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements[1].borders.between.space).to eq(OoxmlParser::OoxmlSize.new(10, :point))
    expect(docx.elements[1].borders.between.size).to eq(OoxmlParser::OoxmlSize.new(12, :one_eighth_point))
  end

  it 'ApiParagraph | SetBottomBorder method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_bottom_border.js')
    expect(docx.elements.first.borders.bottom.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements.first.borders.bottom.size).to eq(OoxmlParser::OoxmlSize.new(8, :one_eighth_point))
    expect(docx.elements.first.borders.bottom.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiParagraph | SetContextualSpacing method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_contextual_spacing.js')
    expect(docx.elements[0].paragraph_properties.contextual_spacing).to be_falsey
    expect(docx.elements[1].paragraph_properties.contextual_spacing).to be_falsey
    expect(docx.elements[2].paragraph_properties.contextual_spacing).to be_falsey
    expect(docx.elements[3].paragraph_properties.contextual_spacing).to be_truthy
    expect(docx.elements[4].paragraph_properties.contextual_spacing).to be_truthy
  end

  it 'ApiParagraph | SetIndFirstLine method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_ind_first_line.js')
    expect(docx.elements.first.ind.first_line_indent).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParagraph | SetIndLeft method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_ind_left.js')
    expect(docx.elements.first.ind.left_indent).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end

  it 'ApiParagraph | SetIndRight method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_ind_right.js')
    expect(docx.elements.first.ind.right_indent).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end

  it 'ApiParagraph | SetJc method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_jc.js')
    expect(docx.elements.first.align).to eq(:left)
    expect(docx.elements[1].align).to eq(:right)
    expect(docx.elements[2].align).to eq(:center)
    expect(docx.elements[3].align).to eq(:justify)
  end

  it 'ApiParagraph | SetKeepLines method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_keep_lines.js')
    docx.elements[0..5].each do |elements|
      expect(elements.keep_lines).to be_falsey
    end
    expect(docx.elements[6].keep_lines).to be_truthy
  end

  it 'ApiParagraph | SetKeepNext method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_keep_next.js')
    expect(docx.elements.first.keep_next).to be_falsey
    docx.elements[1..5].each do |elements|
      expect(elements.keep_next).to be_truthy
    end
    expect(docx.elements[6].keep_next).to be_falsey
  end

  it 'ApiParagraph | SetLeftBorder method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_left_border.js')
    expect(docx.elements.first.borders.left.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.borders.left.val).to eq(:single)
    expect(docx.elements.first.borders.left.space).to eq(OoxmlParser::OoxmlSize.new(8, :point))
    expect(docx.elements.first.borders.left.size).to eq(OoxmlParser::OoxmlSize.new(16, :one_eighth_point))
  end

  it 'ApiParagraph | SetNumbering method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_numbering.js')
    docx.elements[1..9].each_with_index do |current_element, index|
      expect(current_element.numbering.ilvl).to eq(index)
      expect(current_element.numbering.parent).not_to be_nil
    end
  end

  it 'ApiParagraph | SetNumPr method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_num_pr.js')
    expect(docx.elements.last.numbering.ilvl).to eq(3)
  end

  it 'ApiParagraph | SetPageBreakBefore method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_page_break_before.js')
    expect(docx.elements.first.page_break).to eq(false)
    expect(docx.elements[1].page_break).to eq(true)
  end

  it 'ApiParagraph | SetRightBorder method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_right_border.js')
    expect(docx.elements.first.borders.right.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements.first.borders.right.val).to eq(:single)
    expect(docx.elements.first.borders.right.space).to eq(OoxmlParser::OoxmlSize.new(8, :point))
    expect(docx.elements.first.borders.right.size).to eq(OoxmlParser::OoxmlSize.new(16, :one_eighth_point))
  end

  it 'ApiParagraph | SetShd method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_shd.js')
    expect(docx.elements.first.paragraph_properties.shade.color).to eq(OoxmlParser::Color.new(255, 0, 0).to_hex.to_sym)
    expect(docx.elements.first.nonempty_runs[0].text).to eq('This is an example of setting a shade to a paragraph. ')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('These sentences are used to add lines for demonstrative purposes. ')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('These sentences are used to add lines for demonstrative purposes. ')
    expect(docx.elements.first.nonempty_runs[3].text).to eq('These sentences are used to add lines for demonstrative purposes. ')
    expect(docx.elements.first.nonempty_runs[4].text).to eq('These sentences are used to add lines for demonstrative purposes. ')
  end

  it 'ApiParagraph | SetSpacingAfter method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_spacing_after.js')
    expect(docx.elements.first.paragraph_properties.spacing.after).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParagraph | SetSpacingBefore method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_spacing_before.js')
    expect(docx.elements[1].paragraph_properties.spacing.before).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParagraph | SetSpacingLine method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_spacing_line.js')
    expect(docx.elements.first.paragraph_properties.spacing.line).to eq(OoxmlParser::OoxmlSize.new(3, :centimeter))
    expect(docx.elements.first.spacing.line_rule).to eq(:auto)
    expect(docx.elements[1].paragraph_properties.spacing.line).to eq(OoxmlParser::OoxmlSize.new(200, :twip))
    expect(docx.elements[1].paragraph_properties.spacing.line_rule).to eq(:exact)
    expect(docx.elements[2].paragraph_properties.spacing.line).to eq(OoxmlParser::OoxmlSize.new(400, :twip))
    expect(docx.elements[2].paragraph_properties.spacing.line_rule).to eq(:at_least)
  end

  it 'ApiParagraph | SetStyle method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_style.js')
    expect(docx.elements.first.style.name).to eq('Heading 6')
  end

  it 'ApiParagraph | SetTabs method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_tabs.js')
    expect(docx.elements.first.paragraph_properties.tabs[0].position).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
    expect(docx.elements.first.paragraph_properties.tabs[0].value).to eq(:left)
    expect(docx.elements.first.paragraph_properties.tabs[1].position).to eq(OoxmlParser::OoxmlSize.new(4320, :twip))
    expect(docx.elements.first.paragraph_properties.tabs[1].value).to eq(:center)
    expect(docx.elements.first.paragraph_properties.tabs[2].position).to eq(OoxmlParser::OoxmlSize.new(7200, :twip))
    expect(docx.elements.first.paragraph_properties.tabs[2].value).to eq(:right)
  end

  it 'ApiParagraph | SetTopBorder method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_top_border.js')
    expect(docx.elements.first.borders.top.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.borders.top.size).to eq(OoxmlParser::OoxmlSize.new(24, :one_eighth_point))
    expect(docx.elements.first.borders.top.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiParagraph | SetWidowControl method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_paragraph/set_widow_control.js')
    expect(docx.elements[5].orphan_control).to be_truthy
  end
end

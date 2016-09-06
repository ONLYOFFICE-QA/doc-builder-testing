require 'spec_helper'
describe 'ApiParagraph section tests' do
  it 'ApiParagraph | AddColumnBreak method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addcolumnbreak.js')
    expect(docx.page_properties.columns.count).to eq(2)
    expect(docx.elements.first.character_style_array[1].text).to eq('This is the text for the first column. It is written all in one text run. Nothing special.')
    expect(docx.elements.first.character_style_array[3].text).to eq('This is the text which starts from the beginning of the second column. ')
    expect(docx.elements.first.character_style_array[4].text).to eq('It is written in two text runs, you need a space at the end of the first run sentence to separate them.')
  end

  it 'ApiParagraph | AddDrawing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/adddrawing.js')
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.type).to eq(:chart)
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.axises.first.title.elements.first.runs.first.text).to eq('Year')
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.axises.first.title.elements.first.runs.first.properties.font_size).to eq(11.0)
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.data.first.points.first.value).to eq(200.0)
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.data.first.points[1].value).to eq(240.0)
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.data.first.points[2].value).to eq(280.0)

    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.data[1].points.first.value).to eq(250.0)
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.data[1].points[1].value).to eq(260.0)
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.data[1].points[2].value).to eq(280.0)

    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.series.first.text.string.cache.points.first.text.value).to eq('Projected Revenue')
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.series[1].text.string.cache.points.first.text.value).to eq('Estimated Costs')

    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.series.first.categories.string.cache.points.first.text.value).to eq('2014')
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.series.first.categories.string.cache.points[1].text.value).to eq('2015')
    expect(docx.elements.first.character_style_array[1].drawings.first.graphic.data.series.first.categories.string.cache.points[2].text.value).to eq('2016')
  end

  it 'ApiParagraph | AddElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addelement.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is the text for a text run. Nothing special.')
  end

  it 'ApiParagraph | AddLineBreak method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addlinebreak.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is the text for the first line. Nothing special.')
    expect(docx.elements.first.character_style_array[2].text).to eq("\r")
    expect(docx.elements.first.character_style_array[3].text).to eq('This is the text which starts from the beginning of the second line. ')
    expect(docx.elements.first.character_style_array[4].text).to eq('It is written in two text runs, you need a space at the end of the first run sentence to separate them.')
  end

  it 'ApiParagraph | AddPageBreak method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addpagebreak.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is the text for the first page. After it a page break will be added. Scroll down to the second page to see the text there.')
    expect(docx.elements.first.character_style_array[3].text).to eq('This is the text which starts from the beginning of the second page. ')
    expect(docx.elements.first.character_style_array[4].text).to eq('It is written in two text runs, you need a space at the end of the first run sentence to separate them.')
  end

  it 'ApiParagraph | AddTabStop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addtabstop.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is just a sample text. After it three tab stops will be added.')
    expect(docx.elements.first.character_style_array[2].text).to eq("\t")
    expect(docx.elements.first.character_style_array[3].text).to eq("\t")
    expect(docx.elements.first.character_style_array[4].text).to eq("\t")
    expect(docx.elements.first.character_style_array[5].text).to eq('This is the text which starts after the tab stops.')
  end

  it 'ApiParagraph | AddText method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addtext.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is just a sample text. Nothing special.')
  end

  it 'ApiParagraph | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getclasstype.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('Class Type = paragraph')
  end

  it 'ApiParagraph | GetElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getelement.js')
    expect(docx.elements.first.character_style_array.first.text).to eq('This is the text for the first text run. Do not forget a space at its end to separate from the second one. ')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is the text for the second run. We will set it bold afterwards. It also needs space at its end. ')
    expect(docx.elements.first.character_style_array[2].text).to eq('This is the text for the third run. It ends the paragraph.')
    expect(docx.elements.first.character_style_array[1].font_style.bold).to be_truthy
  end

  it 'ApiParagraph | GetElementsCount method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getelementscount.js')
    expect(docx.elements.first.character_style_array.first.text).to eq("Number of paragraph elements at this point: \t0\rNumber of paragraph elements after we added a text run: \t1")
  end

  it 'ApiParagraph | GetNumbering method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getnumbering.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is the first element of a numbered list')
    expect(docx.elements.first.numbering.numbering_properties).to eq(1)
    expect(docx.elements[1].character_style_array[0].text).to eq('This is the second element of a numbered list')
    expect(docx.elements[1].numbering.numbering_properties).to eq(1)
  end

  it 'ApiParagraph | GetParagraphMarkTextPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getparagraphmarktextpr.js')
    expect(docx.elements.first.paragraph_properties.run_properties.size.value).to eq(52)
    expect(docx.elements.first.paragraph_properties.run_properties.color).to eq(OoxmlParser::Color.new(255, 255, 0))
  end

  it 'ApiParagraph | GetParaPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getparapr.js')
    expect(docx.elements.first.spacing.line).to eq(2)
    expect(docx.elements.first.ind.first_line_indent).to eq(OoxmlParser::OoxmlSize.new(1.27, :centimeter))
  end

  it 'ApiParagraph | RemoveAllElements method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/removeallelements.js')
    expect(docx.elements.first.character_style_array.first.text).to eq("This is the first document paragraph. We removed all the elements to get the number of paragraph elements at this point: 0. If we had not done that the number before this sentence would be \'1\'.")
  end

  it 'ApiParagraph | RemoveElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/removeelement.js')
    expect(docx.elements.first.character_style_array.first.text).to eq('This is the first paragraph element. ')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is the second paragraph element. ')
  end

  it 'ApiParagraph | SetBetweenBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setbetweenborder.js')
    expect(docx.elements.first.borders.between.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.borders.between.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements.first.borders.between.sz).to eq(OoxmlParser::OoxmlSize.new(24, :one_eighth_point))
    expect(docx.elements[1].borders.between.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements[1].borders.between.space).to eq(OoxmlParser::OoxmlSize.new(10, :point))
    expect(docx.elements[1].borders.between.sz).to eq(OoxmlParser::OoxmlSize.new(12, :one_eighth_point))
  end

  it 'ApiParagraph | SetBottomBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setbottomborder.js')
    expect(docx.elements.first.borders.bottom.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements.first.borders.bottom.sz).to eq(OoxmlParser::OoxmlSize.new(8, :one_eighth_point))
    expect(docx.elements.first.borders.bottom.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiParagraph | SetContextualSpacing method' do
    pending 'ContextualSpacing is not work in parser https://github.com/ONLYOFFICE/ooxml_parser/issues/203'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setcontextualspacing.js')
    expect(docx.elements.first.contextual_spacing).to eq(false)
    expect(docx.elements[1].contextual_spacing).to eq(false)
    expect(docx.elements[2].contextual_spacing).to eq(false)
    expect(docx.elements[3].contextual_spacing).to eq(true)
    expect(docx.elements[4].contextual_spacing).to eq(true)
  end

  it 'ApiParagraph | SetIndFirstLine method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setindfirstline.js')
    expect(docx.elements.first.ind.first_line_indent).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParagraph | SetIndLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setindleft.js')
    expect(docx.elements.first.ind.left_indent).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end

  it 'ApiParagraph | SetIndRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setindright.js')
    expect(docx.elements.first.ind.right_indent).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end

  it 'ApiParagraph | SetJc method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setjc.js')
    expect(docx.elements.first.align).to eq(:left)
    expect(docx.elements[1].align).to eq(:right)
    expect(docx.elements[2].align).to eq(:center)
    expect(docx.elements[3].align).to eq(:justify)
  end

  it 'ApiParagraph | SetKeepLines method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setkeeplines.js')
    docx.elements[0..5].each do |elements|
      expect(elements.keep_lines).to be_falsey
    end
    expect(docx.elements[6].keep_lines).to be_truthy
  end

  it 'ApiParagraph | SetKeepNext method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setkeepnext.js')
    expect(docx.elements.first.keep_next).to be_falsey
    docx.elements[1..5].each do |elements|
      expect(elements.keep_next).to be_truthy
    end
    expect(docx.elements[6].keep_next).to be_falsey
  end

  it 'ApiParagraph | SetLeftBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setleftborder.js')
    expect(docx.elements.first.borders.left.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.borders.left.val).to eq(:single)
    expect(docx.elements.first.borders.left.space).to eq(OoxmlParser::OoxmlSize.new(8, :point))
    expect(docx.elements.first.borders.left.sz).to eq(OoxmlParser::OoxmlSize.new(16, :one_eighth_point))
  end

  it 'ApiParagraph | SetNumbering method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setnumbering.js')
    docx.elements[1..9].each_with_index do |current_element, index|
      expect(current_element.numbering.ilvl).to eq(index)
      expect(current_element.numbering.parent.nil?).to be_falsey
    end
  end

  it 'ApiParagraph | SetNumPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setnumpr.js')
    expect(docx.elements.last.numbering.ilvl).to eq(3)
  end

  it 'ApiParagraph | SetPageBreakBefore method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setpagebreakbefore.js')
    expect(docx.elements.first.page_break).to eq(false)
    expect(docx.elements[1].page_break).to eq(true)
  end

  it 'ApiParagraph | SetRightBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setrightborder.js')
    expect(docx.elements.first.borders.right.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements.first.borders.right.val).to eq(:single)
    expect(docx.elements.first.borders.right.space).to eq(OoxmlParser::OoxmlSize.new(8, :point))
    expect(docx.elements.first.borders.right.sz).to eq(OoxmlParser::OoxmlSize.new(16, :one_eighth_point))
  end

  it 'ApiParagraph | SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setshd.js')
    expect(docx.elements.first.background_color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements.first.character_style_array[1].text).to eq('This is an example of setting a shade to a paragraph. ')
    expect(docx.elements.first.character_style_array[2].text).to eq('These sentences are used to add lines for demonstrative purposes. ')
    expect(docx.elements.first.character_style_array[3].text).to eq('These sentences are used to add lines for demonstrative purposes. ')
    expect(docx.elements.first.character_style_array[4].text).to eq('These sentences are used to add lines for demonstrative purposes. ')
    expect(docx.elements.first.character_style_array[5].text).to eq('These sentences are used to add lines for demonstrative purposes. ')
  end

  it 'ApiParagraph | SetSpacingAfter method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setspacingafter.js')
    expect(docx.elements.first.paragraph_properties.spacing.after).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParagraph | SetSpacingBefore method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setspacingbefore.js')
    expect(docx.elements[1].paragraph_properties.spacing.before).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParagraph | SetSpacingLine method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setspacingline.js')
    expect(docx.elements.first.paragraph_properties.spacing.line).to eq(OoxmlParser::OoxmlSize.new(3, :centimeter))
    expect(docx.elements.first.spacing.line_rule).to eq(:auto)
    expect(docx.elements[1].paragraph_properties.spacing.line).to eq(OoxmlParser::OoxmlSize.new(200, :twip))
    expect(docx.elements[1].paragraph_properties.spacing.line_rule).to eq(:exact)
    expect(docx.elements[2].paragraph_properties.spacing.line).to eq(OoxmlParser::OoxmlSize.new(400, :twip))
    expect(docx.elements[2].paragraph_properties.spacing.line_rule).to eq(:at_least)
  end

  it 'ApiParagraph | SetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setstyle.js')
    expect(docx.elements.first.style.name).to eq('Heading 6')
  end

  it 'ApiParagraph | SetTabs method' do
    pending 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/206'
    expect('parser error fixed?').to eq('yes')
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/settabs.js')
    expect(docx.elements.first.tabs.first.position).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
    expect(docx.elements.first.tabs.first.align).to eq(:left)
    expect(docx.elements.first.tabs[1].position).to eq(OoxmlParser::OoxmlSize.new(4320, :twip))
    expect(docx.elements.first.tabs[1].align).to eq(:center)
    expect(docx.elements.first.tabs[2].position).to eq(OoxmlParser::OoxmlSize.new(7200, :twip))
    expect(docx.elements.first.tabs[2].align).to eq(:right)
  end

  it 'ApiParagraph | SetTopBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/settopborder.js')
    expect(docx.elements.first.borders.top.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.borders.top.sz).to eq(OoxmlParser::OoxmlSize.new(24, :one_eighth_point))
    expect(docx.elements.first.borders.top.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiParagraph | SetWidowControl method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setwidowcontrol.js')
    expect(docx.elements[5].orphan_control).to be_truthy
  end
end

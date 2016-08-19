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
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | AddLineBreak method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addlinebreak.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | AddPageBreak method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addpagebreak.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | AddTabStop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addtabstop.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | AddText method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addtext.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | GetElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getelement.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | GetElementsCount method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getelementscount.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | GetNumbering method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getnumbering.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | GetParagraphMarkTextPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getparagraphmarktextpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | GetParaPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getparapr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | RemoveAllElements method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/removeallelements.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | RemoveElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/removeelement.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetBetweenBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setbetweenborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetBottomBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setbottomborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetContextualSpacing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setcontextualspacing.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetIndFirstLine method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setindfirstline.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetIndLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setindleft.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetIndRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setindright.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetJc method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setjc.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetKeepLines method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setkeeplines.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetKeepNext method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setkeepnext.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetLeftBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setleftborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetNumbering method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setnumbering.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetNumPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setnumpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetPageBreakBefore method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setpagebreakbefore.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetRightBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setrightborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setshd.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetSpacingAfter method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setspacingafter.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetSpacingBefore method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setspacingbefore.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetSpacingLine method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setspacingline.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setstyle.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetTabs method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/settabs.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetTopBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/settopborder.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiParagraph | SetWidowControl method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setwidowcontrol.js')
    expect(docx.nil?).to eq(false)
  end
end

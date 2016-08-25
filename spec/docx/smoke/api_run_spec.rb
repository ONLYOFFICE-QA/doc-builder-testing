require 'spec_helper'
describe 'ApiRun section tests' do
  it 'ApiRun | AddColumnBreak method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addcolumnbreak.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is the text for the first column. It is written all in one text run. Nothing special.This is the text which starts from the beginning of the second column. It is written in two text runs, you need a space at the end of the first run sentence to separate them.')
    expect(docx.page_properties.columns.count).to eq(2)
  end

  it 'ApiRun | AddDrawing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/adddrawing.js')
    expect(docx.elements.first.nonempty_runs.first.drawing.graphic.type).to eq(:chart)
    expect(docx.elements.first.nonempty_runs.first.drawing.graphic.data.type).to eq(:bar_3d)
    docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.series.each do |series|
      expect(series.categories.string.cache.points.map { |current_point| current_point.text.value }).to eq(%w(2014 2015 2016))
    end
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.series.first.text.string.cache.points.first.text.value).to eq('Projected Revenue')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.series.last.text.string.cache.points.first.text.value).to eq('Estimated Costs')
    expect(docx.elements.first.nonempty_runs.first.drawing.graphic.data.title.elements.first.runs.first.text).to eq('Financial Overview')
    expect(docx.elements.first.nonempty_runs.first.drawing.properties.object_size.x).to eq(OoxmlParser::OoxmlSize.new(4_051_299, :emu))
  end

  it 'ApiRun | AddLineBreak method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addlinebreak.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq("This is the text for the first line. Nothing special.\rThis is the text which starts from the beginning of the second line. It is written in two text runs, you need a space at the end of the first run sentence to separate them.")
  end

  it 'ApiRun | AddPageBreak method' do
    pending 'Parser error'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addpagebreak.js')
    expect(docx.elements.first.page_break).to be_truthy
  end

  it 'ApiRun | AddTabStop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addtabstop.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq("This is just a sample text. After it three tab stops will be added.\t\t\tThis is the text which starts after the tab stops.")
  end

  it 'ApiRun | AddText method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/addtext.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is just a sample text. Nothing special.')
  end

  it 'ApiRun | ClearContent method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/clearcontent.js')
    docx.elements.first.character_style_array.each do |current_run|
      expect(current_run.text.empty?).to be_truthy
    end
    expect(docx.elements[1].nonempty_runs.first.text).to eq('The text in the previous paragraph cannot be seen, as it has been cleared.')
    expect(docx.elements[1].nonempty_runs.size).to eq(1)
  end

  it 'ApiRun | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/getclasstype.js')
    expect(docx.elements.last.nonempty_runs.first.text).to eq('Class Type = run')
  end

  it 'ApiRun | GetTextPr method' do
    pending '`rStyle` is not parsed for run properties https://github.com/ONLYOFFICE/ooxml_parser/issues/140'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/gettextpr.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('This is just a sample text. The text properties are changed and the style is added to the paragraph. ')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with its own style.')
    expect(docx.elements.first.nonempty_runs[1].font).to eq('Calibri Light')
  end

  it 'ApiRun | SetBold method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setbold.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('This is just a sample text. ')
    expect(docx.elements.first.nonempty_runs[1].font_style.bold).to be_truthy
  end

  it 'ApiRun | SetCaps method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setcaps.js')
    expect(docx.elements.first.nonempty_runs[1].caps).to eq(:caps)
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the font set to capitalized letters.')
  end

  it 'ApiRun | SetColor method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setcolor.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the font color set to blue.')
    expect(docx.elements.first.nonempty_runs[1].font_color).to eq(OoxmlParser::Color.new(0, 0, 255))
  end

  it 'ApiRun | SetDoubleStrikeout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setdoublestrikeout.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text struck out with two lines.')
    expect(docx.elements.first.nonempty_runs[1].font_style.strike).to eq(:double)
  end

  it 'ApiRun | SetFontFamily method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setfontfamily.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the font family set to \'Calibri Light\'.')
    expect(docx.elements.first.nonempty_runs[1].font).to eq('Calibri Light')
  end

  it 'ApiRun | SetFontSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setfontsize.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the font size set to 15 points (30 half-points).')
    expect(docx.elements.first.nonempty_runs[1].size).to eq(15.0)
  end

  it 'ApiRun | SetHighlight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/sethighlight.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text highlighted with yellow color.')
    expect(docx.elements.first.nonempty_runs[1].highlight).to eq('yellow')
  end

  it 'ApiRun | SetItalic method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setitalic.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the font set to italicized letters.')
    expect(docx.elements.first.nonempty_runs[1].font_style.italic).to be_truthy
  end

  it 'ApiRun | SetLanguage method' do
    pending 'Parser error Add language option for run object https://github.com/ONLYOFFICE/ooxml_parser/issues/142'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setlanguage.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text language set to English (Canada).')
    expect(docx.elements.first.nonempty_runs[1].language).to eq('en-CA')
  end

  it 'ApiRun | SetPosition method' do
    pending 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/143'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setposition.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text raised 5 points (10 half-points).')
    expect(docx.elements.first.nonempty_runs[1].position).to eq(OoxmlParser::OoxmlSize.new(10, :hps))

    expect(docx.elements.first.nonempty_runs[2].text).to eq('This is a text run with the text lowered 8 points (16 half-points).')
    expect(docx.elements.first.nonempty_runs[2].position).to eq(OoxmlParser::OoxmlSize.new(-16, :hps))
  end

  it 'ApiRun | SetShd method' do
    pending 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/144'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setshd.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text shading set to green.')
    expect(docx.elements.first.nonempty_runs[1].background_color.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.nonempty_runs[1].background_color.type).to eq('clear')
  end

  it 'ApiRun | SetSmallCaps method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setsmallcaps.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the font set to small capitalized letters.')
    expect(docx.elements.first.nonempty_runs[1].caps).to eq(:small_caps)
  end

  it 'ApiRun | SetSpacing method' do
    pending 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/136'
    expect('fixed?').to be_truthy
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setspacing.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text spacing set to 4 points (20 twentieths of a point).')
    expect(docx.elements.first.nonempty_runs[1].spacing).to eq(OoxmlParser::OoxmlSize.new(80, :twips))
  end

  it 'ApiRun | SetStrikeout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setstrikeout.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text struck out with a single line.')
    expect(docx.elements.first.nonempty_runs[1].font_style.strike).to eq(:single)
  end

  it 'ApiRun | SetStyle method' do
    pending '`rStyle` is not parsed for run properties https://github.com/ONLYOFFICE/ooxml_parser/issues/140'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setstyle.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with its own style.')
    expect(docx.elements.first.nonempty_runs[1].font).to eq('Calibri Light')
  end

  it 'ApiRun | SetUnderline method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setunderline.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text underlined with a single line.')
    expect(docx.elements.first.nonempty_runs[1].font_style.underlined.style).to eq('single')
  end

  it 'ApiRun | SetVertAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRun/setvertalign.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('This is a text run with the text aligned below the baseline vertically. ')
    expect(docx.elements.first.nonempty_runs[1].vertical_align).to eq(:subscript)
    expect(docx.elements.first.nonempty_runs[3].text).to eq('This is a text run with the text aligned above the baseline vertically.')
    expect(docx.elements.first.nonempty_runs[3].vertical_align).to eq(:superscript)
  end
end

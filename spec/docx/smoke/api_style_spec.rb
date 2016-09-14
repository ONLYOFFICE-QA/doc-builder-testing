require 'spec_helper'
describe 'ApiStyle section tests' do
  it 'ApiStyle | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/getclasstype.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = style')
    expect(docx.elements[1].class).to eq(OoxmlParser::Table)
  end

  it 'ApiStyle | GetConditionalTableStyle method' do
    pending 'http://bugzilla.onlyoffice.com/show_bug.cgi?id=33014'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/getconditionaltablestyle.js')
    expect(docx.elements[1].rows[0].cells[0].elements.first.nonempty_runs.first.font_style.italic).to be_truthy
    expect(docx.elements[1].rows[0].cells[0].elements.first.nonempty_runs.first.font_style.italic).to be_truthy
    expect(docx.elements[1].rows[0].cells[0].elements.first.nonempty_runs.first.text).to eq('This cell font is set to italic')

    expect(docx.elements[1].rows[1].cells[0].elements.first.nonempty_runs.first.font_style.italic).to be_truthy
    expect(docx.elements[1].rows[1].cells[0].elements.first.nonempty_runs.first.font_style.italic).to be_truthy
    expect(docx.elements[1].rows[1].cells[0].elements.first.nonempty_runs.first.text).to eq('This cell font is also set to italic')

    expect(docx.elements[1].rows[0].cells[1].elements.first.nonempty_runs.first.font_style.italic).to be_falsey
    expect(docx.elements[1].rows[0].cells[1].elements.first.nonempty_runs.first.font_style.italic).to be_falsey
    expect(docx.elements[1].rows[0].cells[1].elements.first.nonempty_runs.first.text).to eq('This set font remains default')

    expect(docx.elements[1].rows[1].cells[1].elements.first.nonempty_runs.first.font_style.italic).to be_falsey
    expect(docx.elements[1].rows[1].cells[1].elements.first.nonempty_runs.first.font_style.italic).to be_falsey
    expect(docx.elements[1].rows[1].cells[1].elements.first.nonempty_runs.first.text).to eq('This set font also remains default')
  end

  it 'ApiStyle | GetName method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/getname.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Table style name = My Custom Style')
  end

  it 'ApiStyle | GetParaPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/getparapr.js')
    expect(docx.elements.first.spacing.line).to eq(2)
    expect(docx.elements.first.spacing.line_rule).to eq(:auto)
    expect(docx.elements.first.ind.first_line_indent).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiStyle | GetTableCellPr method' do
    pending 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/159'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettablecellpr.js')
    expect(docx.elements[1].rows.first.cells.first.properties.color.class).to eq(OoxmlParser::Color)
  end

  it 'ApiStyle | GetTablePr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettablepr.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.top).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.left).to eq(OoxmlParser::OoxmlSize.new(120, :twip))
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.right).to eq(OoxmlParser::OoxmlSize.new(120, :twip))
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.bottom).to eq(OoxmlParser::OoxmlSize.new(0, :twip))
  end

  it 'ApiStyle | GetTableRowPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettablerowpr.js')
    expect(docx.elements[1].properties.table_style.table_row_properties.height.value).to eq(OoxmlParser::OoxmlSize.new(1440))
  end

  it 'ApiStyle | GetTextPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettextpr.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('This is a paragraph with the text color, font family and font size set using the text style. ')
    expect(docx.elements.first.nonempty_runs[0].font).to eq('Calibri Light')
    expect(docx.elements.first.nonempty_runs[0].font_color).to eq(OoxmlParser::Color.new(38, 38, 38))
    expect(docx.elements.first.nonempty_runs[1].text).to eq('We do not change the style of the paragraph itself. ')
    expect(docx.elements.first.nonempty_runs[1].font_color).to eq(OoxmlParser::Color.new(38, 38, 38))
    expect(docx.elements.first.nonempty_runs[1].font).to eq('Calibri Light')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Only document-wide text styles are applied.')
    expect(docx.elements.first.nonempty_runs[2].font_color).to eq(OoxmlParser::Color.new(38, 38, 38))
    expect(docx.elements.first.nonempty_runs[2].font).to eq('Calibri Light')
  end

  it 'ApiStyle | GetType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/gettype.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('Style type = table')
  end

  it 'ApiStyle | SetBasedOn method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/setbasedon.js')
    style_name = docx.elements[1].properties.table_style.name
    expect(style_name).to eq('CustomTableStyle')
    expect(docx.document_style_by_name(style_name).based_on_style.name).to eq('Bordered - Accent 5')
  end

  it 'ApiStyle | SetName method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiStyle/setname.js')
    expect(docx.elements[1].properties.table_style.name).to eq('My Custom Style')
  end
end

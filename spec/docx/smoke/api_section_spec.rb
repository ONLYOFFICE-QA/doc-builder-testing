require 'spec_helper'
describe 'ApiSection section tests' do
  it 'ApiSection | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/getclasstype.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = section')
  end

  it 'ApiSection | GetFooter method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/getfooter.js')
    expect(docx.notes.first.type).to eq('footer1')
    expect(docx.notes.first.elements.first.nonempty_runs.first.text).to eq('This is a page footer')
  end

  it 'ApiSection | GetHeader method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/getheader.js')
    expect(docx.notes.first.type).to eq('header1')
    expect(docx.notes.first.elements.first.nonempty_runs.first.text).to eq('This is a page header')
  end

  it 'ApiSection | RemoveFooter method' do
    pending 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/151'
    expect('fixed?').to eq('true')
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/removefooter.js')
    expect(docx.notes.first.elements.first.nonempty_runs.first.text).to eq('This is page footer #2. ')
    expect(docx.notes.first.elements.size).to eq(1)
  end

  it 'ApiSection | RemoveHeader method' do
    pending 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/151'
    expect('fixed?').to eq('true')
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/removeheader.js')
    expect(docx.notes.first.elements.first.nonempty_runs.first.text).to eq('This is page header #2. ')
    expect(docx.notes.first.elements.size).to eq(1)
  end

  it 'ApiSection | SetEqualColumns method' do
    pending 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/152'
    expect('fixed?').to eq('true')
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setequalcolumns.js')
    expect(docx.page_properties.columns.count).to eq(3)
  end

  it 'ApiSection | SetFooterDistance method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setfooterdistance.js')
    expect(docx.page_properties.margins.footer).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiSection | SetHeaderDistance method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setheaderdistance.js')
    expect(docx.page_properties.margins.header).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiSection | SetNotEqualColumns method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setnotequalcolumns.js')
    expect(docx.page_properties.columns.column_array[0].space).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
    expect(docx.page_properties.columns.column_array[0].width).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
    expect(docx.page_properties.columns.column_array[1].space).to eq(OoxmlParser::OoxmlSize.new(480, :twip))
    expect(docx.page_properties.columns.column_array[1].width).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
    expect(docx.page_properties.columns.column_array[2].space).to eq(OoxmlParser::OoxmlSize.new(0, :twip))
    expect(docx.page_properties.columns.column_array[2].width).to eq(OoxmlParser::OoxmlSize.new(4320, :twip))
  end

  it 'ApiSection | SetPageMargins method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setpagemargins.js')
    expect(docx.page_properties.margins.top).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
    expect(docx.page_properties.margins.right).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
    expect(docx.page_properties.margins.left).to eq(OoxmlParser::OoxmlSize.new(7200, :twip))
    expect(docx.page_properties.margins.bottom).to eq(OoxmlParser::OoxmlSize.new(5760, :twip))
  end

  it 'ApiSection | SetPageSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setpagesize.js')
    expect(docx.page_properties.size.height).to eq(OoxmlParser::OoxmlSize.new(4320, :twip))
    expect(docx.page_properties.size.width).to eq(OoxmlParser::OoxmlSize.new(7200, :twip))

  end

  it 'ApiSection | SetTitlePage method' do
    pending 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/151'
    expect('fixed?').to eq('true')
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/settitlepage.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiSection | SetType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/settype.js')
    expect(docx.page_properties.type).to eq('continuous')
  end
end

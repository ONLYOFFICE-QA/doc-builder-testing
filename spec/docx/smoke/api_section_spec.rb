# frozen_string_literal: true

require 'spec_helper'
describe 'ApiSection section tests' do
  it 'ApiSection | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/get_class_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = section')
  end

  it 'ApiSection | GetFooter method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/get_footer.js')
    expect(docx.notes.first.type).to eq('footer1')
    expect(docx.notes.first.elements.first.nonempty_runs.first.text).to eq('This is a page footer')
  end

  it 'ApiSection | GetHeader method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/get_header.js')
    expect(docx.notes.first.type).to eq('header1')
    expect(docx.notes.first.elements.first.nonempty_runs.first.text).to eq('This is a page header')
  end

  it 'ApiSection | RemoveFooter method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/remove_footer.js')
    expect(docx.notes.first.elements.first.nonempty_runs.first.text).to eq('This is page footer #2. ')
    expect(docx.notes.first.elements.size).to eq(1)
  end

  it 'ApiSection | RemoveHeader method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/remove_header.js')
    expect(docx.notes.first.elements.first.nonempty_runs.first.text).to eq('This is page header #2. ')
    expect(docx.notes.first.elements.size).to eq(1)
  end

  it 'ApiSection | SetEqualColumns method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/set_equal_columns.js')
    expect(docx.page_properties.columns.count).to eq(3)
  end

  it 'ApiSection | SetFooterDistance method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/set_footer_distance.js')
    expect(docx.page_properties.margins.footer).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiSection | SetHeaderDistance method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/set_header_distance.js')
    expect(docx.page_properties.margins.header).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiSection | SetNotEqualColumns method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/set_not_equal_columns.js')
    expect(docx.page_properties.columns.column_array[0].space).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
    expect(docx.page_properties.columns.column_array[0].width).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
    expect(docx.page_properties.columns.column_array[1].space).to eq(OoxmlParser::OoxmlSize.new(480, :twip))
    expect(docx.page_properties.columns.column_array[1].width).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
    expect(docx.page_properties.columns.column_array[2].space).to eq(OoxmlParser::OoxmlSize.new(0, :twip))
    expect(docx.page_properties.columns.column_array[2].width).to eq(OoxmlParser::OoxmlSize.new(4320, :twip))
  end

  it 'ApiSection | SetPageMargins method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/set_page_margins.js')
    expect(docx.page_properties.margins.top).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
    expect(docx.page_properties.margins.right).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
    expect(docx.page_properties.margins.left).to eq(OoxmlParser::OoxmlSize.new(7200, :twip))
    expect(docx.page_properties.margins.bottom).to eq(OoxmlParser::OoxmlSize.new(5760, :twip))
  end

  it 'ApiSection | SetPageSize method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/set_page_size.js')
    expect(docx.page_properties.size.height).to eq(OoxmlParser::OoxmlSize.new(4320, :twip))
    expect(docx.page_properties.size.width).to eq(OoxmlParser::OoxmlSize.new(7200, :twip))
  end

  it 'ApiSection | SetTitlePage method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/set_title_page.js')
    expect(docx.elements.first.paragraph_properties.section_properties.title_page).to be_truthy
  end

  it 'ApiSection | SetType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/set_type.js')
    expect(docx.page_properties.type).to eq('continuous')
  end

  it 'ApiSection | GetStartPageNumber method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/get_start_page_number.js')
    expect(docx.notes[0].elements.first.nonempty_runs.first.text).to eq('GetStartPageNumber: -1')
    expect(docx.notes[1].elements.first.nonempty_runs.first.text).to eq('GetStartPageNumber: 3')
  end

  it 'ApiSection | SetStartPageNumber method' do
    docx = builder.build_and_parse('js/docx/smoke/api_section/set_start_page_number.js')
    expect(docx.notes[0].elements.first.nonempty_runs.first.text).to eq('Page #4')
  end
end

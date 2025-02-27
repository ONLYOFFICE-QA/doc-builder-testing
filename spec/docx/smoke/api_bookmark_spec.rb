# frozen_string_literal: true

require 'spec_helper'
describe 'ApiBookmark section tests' do
  before { skip 'new methods' if builder.semver < Semantic::Version.new('8.3.0') }

  it 'ApiChart | GoTo method' do
    docx = builder.build_and_parse('js/docx/smoke/api_bookmark/go_to.js')
    expect(docx.elements.first.nonempty_runs[1].class).to eq(OoxmlParser::BookmarkStart)
    expect(docx.elements.first.nonempty_runs[2].class).to eq(OoxmlParser::DocxParagraphRun)
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Builder')
    expect(docx.elements.first.nonempty_runs[3].class).to eq(OoxmlParser::BookmarkEnd)

    expect(docx.elements[1].nonempty_runs.first.text).to eq('Builder')
  end

  it 'ApiChart | Select method' do
    docx = builder.build_and_parse('js/docx/smoke/api_bookmark/select.js')
    expect(docx.elements.first.nonempty_runs[1].class).to eq(OoxmlParser::BookmarkStart)
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Builder')
    expect(docx.elements.first.nonempty_runs[2].font_style).to eq(OoxmlParser::FontStyle.new(true))
    expect(docx.elements.first.nonempty_runs[3].class).to eq(OoxmlParser::BookmarkEnd)
  end

  it 'ApiChart | SetName method' do
    docx = builder.build_and_parse('js/docx/smoke/api_bookmark/set_name.js')
    expect(docx.elements.first.nonempty_runs[0].class).to eq(OoxmlParser::BookmarkStart)
    expect(docx.elements.first.nonempty_runs[1].class).to eq(OoxmlParser::DocxParagraphRun)
    expect(docx.elements.first.nonempty_runs[2].class).to eq(OoxmlParser::BookmarkEnd)

    expect(docx.elements[1].nonempty_runs.first.text).to eq('Bookmark by old name: null, by new name: Bookmark_B')
  end

  it 'ApiChart | GetName method' do
    docx = builder.build_and_parse('js/docx/smoke/api_bookmark/get_name.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Bookmark name: Bookmark_Name')
  end

  it 'ApiChart | SetText method' do
    docx = builder.build_and_parse('js/docx/smoke/api_bookmark/set_text.js')
    expect(docx.elements.first.nonempty_runs[1].class).to eq(OoxmlParser::BookmarkStart)
    expect(docx.elements.first.nonempty_runs[2].class).to eq(OoxmlParser::DocxParagraphRun)
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Bookmark SetText')
    expect(docx.elements.first.nonempty_runs[3].class).to eq(OoxmlParser::BookmarkEnd)
  end

  it 'ApiChart | GetText method' do
    docx = builder.build_and_parse('js/docx/smoke/api_bookmark/get_text.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Bookmark text: Document')
  end

  it 'ApiChart | GetRange method' do
    docx = builder.build_and_parse('js/docx/smoke/api_bookmark/get_range.js')
    expect(docx.elements.first.nonempty_runs[1].class).to eq(OoxmlParser::BookmarkStart)
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Document')
    expect(docx.elements.first.nonempty_runs[2].font_style).to eq(OoxmlParser::FontStyle.new(true))
    expect(docx.elements.first.nonempty_runs[3].class).to eq(OoxmlParser::BookmarkEnd)
  end

  it 'ApiChart | Delete method' do
    docx = builder.build_and_parse('js/docx/smoke/api_bookmark/delete.js')
    expect(docx.elements.first.nonempty_runs[0].class).to eq(OoxmlParser::DocxParagraphRun)
    expect(docx.elements.first.nonempty_runs[0].text).to eq('ONLYOFFICE')
    expect(docx.elements.first.nonempty_runs[2].class).to eq(OoxmlParser::BookmarkStart)
    expect(docx.elements.first.nonempty_runs[3].class).to eq(OoxmlParser::DocxParagraphRun)
    expect(docx.elements.first.nonempty_runs[3].text).to eq('Document')
    expect(docx.elements.first.nonempty_runs[4].class).to eq(OoxmlParser::BookmarkEnd)

    expect(docx.elements[1].nonempty_runs.first.text).to eq('All bookmarks: Bookmark 2, deleted GetBookmark: null')
  end
end

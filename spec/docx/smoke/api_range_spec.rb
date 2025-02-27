# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRange section tests' do
  it 'ApiRange | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_range/to_json.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('ONLYOFFICE')
    json = JSON.parse(docx.elements[0].nonempty_runs.first.text)
    expect(json['type']).to eq('document')
    expect(json['content'][0]['content'][1]['content'][0]).to eq('ONLYOFFICE')
  end

  describe 'ApiRange | GetRange method' do
    let(:style) { OoxmlParser::FontStyle.new(true, true) }
    let(:file_path) { 'js/docx/smoke/api_range/get_range_with_params.js' }
    let(:docx) { builder.build_and_parse('js/docx/smoke/api_range/get_range.js') }

    it 'Check document structure' do
      expect(docx.elements[0].nonempty_runs.size).to eq(1)
      expect(docx.elements[1].nonempty_runs.size).to eq(4)
    end

    it 'Check method for document' do
      style.italic = false
      expect(docx.elements[0].nonempty_runs[0].text).to eq('Document Builder')
      expect(docx.elements[0].nonempty_runs[0].font_style).to eq(style)
      expect(docx.elements[0].nonempty_runs[0].font_color).to eq(OoxmlParser::Color.new)

      expect(docx.elements[1].nonempty_runs[3].text).to eq('method')
      expect(docx.elements[1].nonempty_runs[3].font_style).to eq(style)
      expect(docx.elements[1].nonempty_runs[3].font_color).to eq(OoxmlParser::Color.new)
    end

    it 'Check method for paragraph' do
      expect(docx.elements[1].nonempty_runs[0].text).to eq('Check ')
      expect(docx.elements[1].nonempty_runs[0].font_style).to eq(style)
      expect(docx.elements[1].nonempty_runs[0].font_color).to eq(OoxmlParser::Color.new)

      # TODO: 'check after release'
      if builder.semver >= Semantic::Version.new('8.2.1')
        expect(docx.elements[1].nonempty_runs[2].text).to eq('nge ')
      else
        expect(docx.elements[1].nonempty_runs[2].text).to eq('ge ')
      end
      expect(docx.elements[1].nonempty_runs[2].font_style).to eq(style)
      expect(docx.elements[1].nonempty_runs[2].font_color).to eq(OoxmlParser::Color.new)
    end

    it 'Check method for another range' do
      # TODO: 'check after release'
      if builder.semver >= Semantic::Version.new('8.2.1')
        expect(docx.elements[1].nonempty_runs[1].text).to eq('GetRa')
      else
        expect(docx.elements[1].nonempty_runs[1].text).to eq('GetRan')
      end
      expect(docx.elements[1].nonempty_runs[1].font_style).to eq(style)
      expect(docx.elements[1].nonempty_runs[1].font_color.to_s).to eq('RGB (255, 0, 0)')
    end

    it 'Check method with parameters 0, 17' do
      skip('Fix after moving to sending the script as a static file') if web_builder?
      docx = builder.build_and_parse(file_path, start_pos: 0, end_pos: 17)
      expect(docx.elements.size).to eq(1)
      expect(docx.elements[0].nonempty_runs.size).to eq(2)

      expect(docx.elements[0].nonempty_runs[0].text).to eq('Document Builder')
      expect(docx.elements[0].nonempty_runs[0].font_style).to eq(OoxmlParser::FontStyle.new(true))
      expect(docx.elements[0].nonempty_runs[1].text).to eq(' check GetRange method')
      expect(docx.elements[0].nonempty_runs[1].font_style).to eq(OoxmlParser::FontStyle.new)
    end

    it 'Check method with parameters 10, 24' do
      skip('Fix after moving to sending the script as a static file') if web_builder?
      docx = builder.build_and_parse(file_path, start_pos: 10, end_pos: 24)
      expect(docx.elements.size).to eq(1)
      expect(docx.elements[0].nonempty_runs.size).to eq(3)

      expect(docx.elements[0].nonempty_runs[0].text).to eq('Document ')
      expect(docx.elements[0].nonempty_runs[0].font_style).to eq(OoxmlParser::FontStyle.new)
      expect(docx.elements[0].nonempty_runs[1].text).to eq('Builder check ')
      expect(docx.elements[0].nonempty_runs[1].font_style).to eq(OoxmlParser::FontStyle.new(true))
      expect(docx.elements[0].nonempty_runs[2].text).to eq('GetRange method')
      expect(docx.elements[0].nonempty_runs[2].font_style).to eq(OoxmlParser::FontStyle.new)
    end
  end

  it 'ApiRange | GetStartPos method' do
    docx = builder.build_and_parse('js/docx/smoke/api_range/get_start_pos.js')
    # TODO: 'check after release'
    if builder.semver >= Semantic::Version.new('8.2.1')
      expect(docx.elements[1].nonempty_runs[0].text).to eq('Run1 start pos = 1')
      expect(docx.elements[1].nonempty_runs[2].text).to eq('Run2 start pos = 14')
      expect(docx.elements[1].nonempty_runs[4].text).to eq('Run3 start pos = 39')
    else
      expect(docx.elements[1].nonempty_runs[0].text).to eq('Run1 start pos = 0')
    end
  end

  it 'ApiRange | GetEndPos method' do
    docx = builder.build_and_parse('js/docx/smoke/api_range/get_end_pos.js')
    # TODO: 'check after release'
    if builder.semver >= Semantic::Version.new('8.2.1')
      expect(docx.elements[1].nonempty_runs[0].text).to eq('Run1 end pos = 14')
      expect(docx.elements[1].nonempty_runs[2].text).to eq('Run2 end pos = 34')
      expect(docx.elements[1].nonempty_runs[4].text).to eq('Run3 end pos = 49')
    else
      expect(docx.elements[1].nonempty_runs[0].text).to eq('Run1 end pos = 13')
    end
  end

  it 'ApiRange | GetTextPr method' do
    docx = builder.build_and_parse('js/docx/smoke/api_range/get_text_pr.js')
    skip 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=68619' if builder.semver <= Semantic::Version.new('8.2.0')
    expect(JSON.parse(docx.elements.last.nonempty_runs.first.text)).to hash_have_no_empty_string_values
  end

  it 'ApiRange | SetStartPos method' do
    docx = builder.build_and_parse('js/docx/smoke/api_range/set_start_pos.js')
    # TODO: 'check after release'
    if builder.semver >= Semantic::Version.new('8.2.1')
      expect(docx.elements[1].nonempty_runs[0].text).to eq('Run start pos = 6')
    else
      expect(docx.elements[1].nonempty_runs[0].text).to eq('Run start pos = 5')
    end
  end

  it 'ApiRange | SetEndPos method' do
    docx = builder.build_and_parse('js/docx/smoke/api_range/set_end_pos.js')
    # TODO: 'check after release'
    if builder.semver >= Semantic::Version.new('8.2.1')
      expect(docx.elements[1].nonempty_runs[0].text).to eq('Run end pos = 26')
    else
      expect(docx.elements[1].nonempty_runs[0].text).to eq('Run end pos = 25')
    end
  end

  it 'ApiRange | AddBookmark method' do
    docx = builder.build_and_parse('js/docx/smoke/api_range/add_bookmark.js')
    expect(docx.elements.first.nonempty_runs[0].class).to eq(OoxmlParser::BookmarkStart)
    expect(docx.elements.first.nonempty_runs[0].name).to eq('Bookmark 1')
    expect(docx.elements.first.nonempty_runs[1].class).to eq(OoxmlParser::DocxParagraphRun)
    expect(docx.elements.first.nonempty_runs[1].text).to eq('ONLYOFFICE')
    expect(docx.elements.first.nonempty_runs[2].class).to eq(OoxmlParser::BookmarkEnd)

    expect(docx.elements.first.nonempty_runs[3].class).to eq(OoxmlParser::DocxParagraphRun)
    expect(docx.elements.first.nonempty_runs[3].text).to eq(' Document ')

    expect(docx.elements.first.nonempty_runs[4].class).to eq(OoxmlParser::BookmarkStart)
    expect(docx.elements.first.nonempty_runs[4].name).to eq('Bookmark 2')
    expect(docx.elements.first.nonempty_runs[5].class).to eq(OoxmlParser::DocxParagraphRun)
    expect(docx.elements.first.nonempty_runs[5].text).to eq('Build')
    expect(docx.elements.first.nonempty_runs[6].class).to eq(OoxmlParser::BookmarkEnd)

    expect(docx.elements.first.nonempty_runs[7].class).to eq(OoxmlParser::DocxParagraphRun)
    expect(docx.elements.first.nonempty_runs[7].text).to eq('er')
  end
end

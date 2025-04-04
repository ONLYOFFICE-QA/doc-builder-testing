# frozen_string_literal: true

require 'spec_helper'
describe 'ApiDocument section tests' do
  it 'ApiDocument | AddElement method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/add_element.js')
    expect(docx.elements[1].nonempty_runs.first.text)
      .to eq('Number of paragraph elements ' \
             "at this point: \t0\rNumber of " \
             'paragraph elements after we ' \
             "added a text run: \t1")
  end

  it 'ApiDocument | CreateNumbering method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/create_numbering.js')
    ilvl = 0
    docx.elements[1..docx.elements.size].each do |current_element|
      expect(current_element.numbering.ilvl).to eq(ilvl)
      current_element.numbering.abstruct_numbering.level_list.each do |current_lvl|
        expect(current_lvl.numbering_format.value).to eq('bullet')
      end
      ilvl += 1
    end
  end

  it 'ApiDocument | CreateSection method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/create_section.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('This is a new paragraph.')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Scroll down to see the new section.')
  end

  it 'ApiDocument | CreateStyle method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/create_style.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is a heading with a style created above')
    expect(docx.elements.first.nonempty_runs.first.size).to eq(20)
    expect(docx.elements.first.nonempty_runs.first.font).to eq('Calibri Light')
    expect(docx.elements.first.nonempty_runs.first.font_color).to eq(OoxmlParser::Color.new(255, 104, 0))
    expect(docx.elements[1].nonempty_runs.first.size).to eq(11)
    expect(docx.elements[1].nonempty_runs.first.font).to eq('Arial')
    expect(docx.elements[1].nonempty_runs.first.font_color).to eq(OoxmlParser::Color.new)
  end

  it 'ApiDocument | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_class_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = document')
  end

  it 'ApiDocument | GetCommentsReport method' do
    skip('GetCommentsReport require local file to open and not aviable in web builder') if web_builder?
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_comments_report.js')
    expect(docx.elements[1].rows[1].cells[3].elements
               .first.nonempty_runs.first.text).to eq('yes')
  end

  it 'ApiDocument | GetDefaultParaPr method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_default_para_pr.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is just a text.')
  end

  it 'ApiDocument | GetDefaultStyle method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_default_style.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is just a text.')
    expect(docx.elements.first.spacing.line).to eq(1.0)
  end

  it 'ApiDocument | GetDefaultTextPr method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_default_text_pr.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is just a text.')
    expect(docx.elements.first.nonempty_runs.first.font).to eq('Comic Sans MS')
    expect(docx.elements.first.nonempty_runs.first.size).to eq(15)
  end

  it 'ApiDocument | GetElement method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_element.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is just a sample text. Nothing special.')
  end

  it 'ApiDocument | GetElementsCount method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_elements_count.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('Number of document elements at this point: ')
    expect(docx.elements.first.nonempty_runs[1].text).to eq("\t")
    expect(docx.elements.first.nonempty_runs[2].text).to eq('1')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Now we add one more paragraph and push it.')
    expect(docx.elements[2].nonempty_runs.first.text).to eq('Number of document elements after we added the second paragraph ')
    expect(docx.elements[2].nonempty_runs[1].text).to eq('but before we push the third one: ')
    expect(docx.elements[2].nonempty_runs[2].text).to eq("\t")
    expect(docx.elements[2].nonempty_runs[3].text).to eq('2')
  end

  it 'ApiDocument | GetFinalSection method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_final_section.js')
    expect(docx.notes.first.elements.first.nonempty_runs.first.text).to eq('This is the text in the default header')
    expect(docx.notes.first.type).to eq('header1')
    expect(docx.notes.first.assigned_to).to eq('default')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is a text in a paragraph.')
  end

  it 'ApiDocument | GetReviewReport method' do
    skip('Cannot use OpenFile in web version') if web_builder?
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_review_report.js')
    expect(docx.elements[3].rows[1].cells[2].elements
               .first.nonempty_runs.first.text).to eq('Formatted text')
  end

  it 'ApiDocument | GetStyle method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_style.js')
    expect(docx.elements.first.style.name).to eq('Heading 6')
    expect(docx.elements.first.nonempty_runs.first.text).to eq("This is a text in a paragraph styled with the 'Heading 6' style.")
  end

  it 'ApiDocument | Push method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/push.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is paragraph #0, you must not push it to take effect.')
    docx.elements[1..docx.elements.size].each_with_index do |current_element, index|
      expect(current_element.nonempty_runs.first.text).to eq("This is paragraph ##{index + 1}, you must push it to take effect.")
    end
  end

  it 'ApiDocument | RemoveAllElements method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/remove_all_elements.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('This is the first paragraph. ')
  end

  it 'ApiDocument | RemoveElement method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/remove_element.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is paragraph #1.')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('This is paragraph #2.')
    expect(docx.elements[2].nonempty_runs.first.text).to eq('This is paragraph #4.')
    expect(docx.elements[3].nonempty_runs.first.text).to eq('This is paragraph #5.')
    expect(docx.elements[4].nonempty_runs.first.text).to eq('We removed paragraph #3, check that out above.')
  end

  it 'ApiDocument | SetEvenAndOddHdrFtr method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/set_even_and_odd_hdr_ftr.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is section #1 of the document. ')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('It has a header and a footer for odd pages. ')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Scroll down to see the other pages.')
    expect(docx.elements.first.sector_properties.notes.first.elements.first.nonempty_runs.first.text).to eq('This is an odd page header')
    expect(docx.elements.first.sector_properties.notes.first.type).to eq('header1')
    expect(docx.elements.first.sector_properties.notes[2].type).to eq('footer1')
    expect(docx.elements.first.sector_properties.notes[2].elements.first.nonempty_runs.first.text).to eq('This is an odd page footer')

    expect(docx.elements[0].sector_properties.notes[1].elements.first.nonempty_runs.first.text).to eq('This is an even page header')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('This is section #2 of the document. ')
    expect(docx.elements[1].nonempty_runs[1].text).to eq('It has a header and a footer for even pages. ')
    expect(docx.elements[1].nonempty_runs[2].text).to eq('Scroll down to see the other pages.')
    expect(docx.elements[0].sector_properties.notes[1].type).to eq('header2')
    expect(docx.elements[0].sector_properties.notes[3].type).to eq('footer2')
    expect(docx.elements[0].sector_properties.notes[3].elements.first.nonempty_runs.first.text).to eq('This is an even page footer')
  end

  it 'ApiDocument | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/to_json.js')
    json = JSON.parse(docx.elements[0].nonempty_runs[0].text)
    expect(json['type']).to eq('document')
    expect(json['content'][1]['type']).to eq(docx.elements[1].nonempty_runs[0].text)
    expect(json['content'][2]['type']).to eq(docx.elements[2].rows[0].cells[0].elements[0].nonempty_runs[0].text)
    expect(json['content'][4]['type']).to eq(docx.elements[4].sdt_content.elements.first.nonempty_runs[0].text)
  end

  it 'ApiDocument | GetAllComments method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_all_comments.js')
    comments_text = docx.comments_document.comments_array.reverse.map do |item|
      item.paragraphs.first.nonempty_runs.first.text
    end
    docx.comments.comments_array.reverse_each do |item|
      comments_text.append(item.paragraphs.first.nonempty_runs.first.text)
    end
    expect(comments_text.join(', ')).to eq(docx.elements.last.nonempty_runs.first.text)
  end

  describe 'ApiDocument | AddMathEquation method' do
    let(:docx) { builder.build_and_parse('js/docx/smoke/api_document/add_math_equation.js') }

    it 'Check with sFormat="unicode"' do
      expect(docx.elements.first.nonempty_runs[0].class).to eq(OoxmlParser::DocxFormula)
      expect(docx.elements.first.nonempty_runs[0].formula_run[0].numerator.formula_run[0].text).to eq('dx')
      expect(docx.elements.first.nonempty_runs[0].formula_run[0].denominator.formula_run[0].text).to eq('dy')
    end

    it 'Check with sFormat="latex"' do
      expect(docx.elements.first.nonempty_runs[2].class).to eq(OoxmlParser::DocxFormula)
      expect(docx.elements.first.nonempty_runs[2].formula_run[0].text).to eq('dx/dy')
    end
  end

  describe 'ApiDocument | GetCurrentWord method' do
    let(:docx) { builder.build_and_parse('js/docx/smoke/api_document/get_current_word.js') }

    it 'Check without sWordPart' do
      expect(docx.elements[1].nonempty_runs.first.text).to eq('word is GetCurrentWord')
    end

    it 'Check with sWordPart="before"' do
      expect(docx.elements[2].nonempty_runs.first.text).to eq('before cursor: GetCur')
    end

    it 'Check with sWordPart="after"' do
      expect(docx.elements[3].nonempty_runs.first.text).to eq('after cursor: rentWord')
    end
  end

  describe 'ApiDocument | ReplaceCurrentWord method' do
    let(:docx) { builder.build_and_parse('js/docx/smoke/api_document/replace_current_word.js') }

    it 'Check without sWordPart' do
      expect(docx.elements.first.nonempty_runs[1].text).to eq('replace ')
    end

    it 'Check with sWordPart="before"/"after"' do
      expect(docx.elements.first.nonempty_runs[2].text).to eq('current word')
    end
  end

  it 'ApiDocument | SelectCurrentWord method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/select_current_word.js')
    expect(docx.elements[1].nonempty_runs[0].text).to eq('selected text is SelectCurrentWord')
  end

  describe 'ApiDocument | GetCurrentSentence method' do
    let(:docx) { builder.build_and_parse('js/docx/smoke/api_document/get_current_sentence.js') }

    it 'Check without sWordPart' do
      expect(docx.elements[1].nonempty_runs.first.text).to eq('sentence is For check GetCurrentSentence.')
    end

    it 'Check with sWordPart="before"' do
      expect(docx.elements[2].nonempty_runs.first.text).to eq('before cursor: For check ')
    end

    it 'Check with sWordPart="after"' do
      expect(docx.elements[3].nonempty_runs.first.text).to eq('after cursor: GetCurrentSentence.')
    end
  end

  it 'ApiDocument | ReplaceCurrentSentence method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/replace_current_sentence.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is text. for check.  Replace current sentence')
  end

  it 'ApiDocument | GetAllBookmarksNames method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_all_bookmarks_names.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Bookmark names: Bookmark 1, Bookmark 2')
  end

  it 'ApiDocument | GetBookmark method' do
    skip 'new methods' if builder.semver < Semantic::Version.new('8.3.0')
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_bookmark.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Bookmark name: Bookmark, text: ONLYOFFICE')
  end

  it 'ApiDocument | GetBookmarkRange method' do
    skip 'new methods' if builder.semver < Semantic::Version.new('8.3.0')
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_bookmark_range.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('ONLYOFFICE')
    expect(docx.elements.first.nonempty_runs[1].font_style).to eq(OoxmlParser::FontStyle.new(true))
  end

  it 'ApiDocument | DeleteBookmark method' do
    skip 'new methods' if builder.semver < Semantic::Version.new('8.3.0')
    docx = builder.build_and_parse('js/docx/smoke/api_document/delete_bookmark.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Delete result: true, GetBookmark result: null')
  end

  it 'ApiDocument | Search method' do
    docx = builder.build_and_parse('js/docx/smoke/api_document/search.js')
    expect(docx.elements[0].nonempty_runs[1].text).to eq('Search')
    expect(docx.elements[0].nonempty_runs[1].highlight).to eq('green')

    expect(docx.elements[1].nonempty_runs[0].link).not_to be_nil
    expect(docx.elements[1].nonempty_runs[2].link).not_to be_nil
    # TODO: 'check after release'
    if builder.semver >= Semantic::Version.new('8.3.0')
      expect(docx.elements[1].nonempty_runs[4].text).to eq('Search')
      expect(docx.elements[1].nonempty_runs[4].highlight).to eq('green')
      expect(docx.elements[2].nonempty_runs.first.text).to eq('Search, Search')
    else
      expect(docx.elements[1].nonempty_runs[3].highlight).to eq('green')
    end
  end

  it 'ApiDocument | GetCurrentPage method' do
    skip 'new methods' if builder.semver < Semantic::Version.new('8.3.0')
    docx = builder.build_and_parse('js/docx/smoke/api_document/get_current_page.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('The current page index is: 0')
    # TODO: 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=73219'
    # expect(docx.elements.first.nonempty_runs[5].text).to eq('The current page index is: 2')
  end
end

require 'spec_helper'
describe 'ApiDocument section tests' do
  it 'ApiDocument | AddElement method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/add_element.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq("Number of paragraph elements at this point: \t0\rNumber of paragraph elements after we added a text run: \t1")
  end

  it 'ApiDocument | CreateNumbering method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/create_numbering.js')
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
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/create_section.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('This is a new paragraph.')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Scroll down to see the new section.')
  end

  it 'ApiDocument | CreateStyle method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/create_style.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is a heading with a style created above')
    expect(docx.elements.first.nonempty_runs.first.size).to eq(20)
    expect(docx.elements.first.nonempty_runs.first.font).to eq('Calibri Light')
    expect(docx.elements.first.nonempty_runs.first.font_color).to eq(OoxmlParser::Color.new(255, 104, 0))
    expect(docx.elements[1].nonempty_runs.first.size).to eq(11)
    expect(docx.elements[1].nonempty_runs.first.font).to eq('Arial')
    expect(docx.elements[1].nonempty_runs.first.font_color).to eq(OoxmlParser::Color.new)
  end

  it 'ApiDocument | GetClassType method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/get_class_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = document')
  end

  it 'ApiDocument | GetCommentsReport method' do
    skip if ENV['BUILDER_PLATFORM'] == 'WEB'
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/get_comments_report.js')
    expect(docx.elements[1].rows[1].cells[3].elements
               .first.nonempty_runs.first.text).to eq('yes')
  end

  it 'ApiDocument | GetDefaultParaPr method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/get_default_para_pr.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is just a text.')
  end

  it 'ApiDocument | GetDefaultStyle method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/get_default_style.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is just a text.')
    expect(docx.elements.first.spacing.line).to eq(1.0)
  end

  it 'ApiDocument | GetDefaultTextPr method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/get_default_text_pr.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is just a text.')
    expect(docx.elements.first.nonempty_runs.first.font).to eq('Comic Sans MS')
    expect(docx.elements.first.nonempty_runs.first.size).to eq(15)
  end

  it 'ApiDocument | GetElement method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/get_element.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is just a sample text. Nothing special.')
  end

  it 'ApiDocument | GetElementsCount method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/get_elements_count.js')
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
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/get_final_section.js')
    expect(docx.notes.first.elements.first.nonempty_runs.first.text).to eq('This is the text in the default header')
    expect(docx.notes.first.type).to eq('header1')
    expect(docx.notes.first.assigned_to).to eq('default')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is a text in a paragraph.')
  end

  it 'ApiDocument | GetReviewReport method' do
    skip if ENV['BUILDER_PLATFORM'] == 'WEB'
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/get_review_report.js')
    expect(docx.elements[3].rows[2].cells[2].elements
               .first.nonempty_runs.first.text).to eq('Removed text')
  end

  it 'ApiDocument | GetStyle method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/get_style.js')
    expect(docx.elements.first.style.name).to eq('Heading 6')
    expect(docx.elements.first.nonempty_runs.first.text).to eq("This is a text in a paragraph styled with the 'Heading 6' style.")
  end

  it 'ApiDocument | Push method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/push.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is paragraph #0, you must not push it to take effect.')
    docx.elements[1..docx.elements.size].each_with_index do |current_element, index|
      expect(current_element.nonempty_runs.first.text).to eq("This is paragraph ##{index + 1}, you must push it to take effect.")
    end
  end

  it 'ApiDocument | RemoveAllElements method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/remove_all_elements.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('This is the first paragraph. ')
  end

  it 'ApiDocument | RemoveElement method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/remove_element.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is paragraph #1.')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('This is paragraph #2.')
    expect(docx.elements[2].nonempty_runs.first.text).to eq('This is paragraph #4.')
    expect(docx.elements[3].nonempty_runs.first.text).to eq('This is paragraph #5.')
    expect(docx.elements[4].nonempty_runs.first.text).to eq('We removed paragraph #3, check that out above.')
  end

  it 'ApiDocument | SetEvenAndOddHdrFtr method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_document/set_even_and_odd_hdr_ftr.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is section #1 of the document. ')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('It has a header and a footer for odd pages. ')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Scroll down to see the other pages.')
    expect(docx.elements.first.sector_properties.notes.first.elements.first.nonempty_runs.first.text).to eq('This is an odd page header')
    expect(docx.elements.first.sector_properties.notes.first.type).to eq('header1')
    expect(docx.elements.first.sector_properties.notes[1].type).to eq('footer1')
    expect(docx.elements.first.sector_properties.notes[1].elements.first.nonempty_runs.first.text).to eq('This is an odd page footer')

    expect(docx.elements[1].sector_properties.notes.first.elements.first.nonempty_runs.first.text).to eq('This is an even page header')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('This is section #2 of the document. ')
    expect(docx.elements[1].nonempty_runs[1].text).to eq('It has a header and a footer for even pages. ')
    expect(docx.elements[1].nonempty_runs[2].text).to eq('Scroll down to see the other pages.')
    expect(docx.elements[1].sector_properties.notes[1].type).to eq('footer2')
    expect(docx.elements[1].sector_properties.notes.first.type).to eq('header2')
    expect(docx.elements[1].sector_properties.notes[1].elements.first.nonempty_runs.first.text).to eq('This is an even page footer')
  end
end

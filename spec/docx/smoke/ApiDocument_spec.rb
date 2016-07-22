require 'spec_helper'
describe 'ApiDocument section tests' do
  it 'ApiDocument | AddElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/addelement.js')
    expect(docx.elements[1].character_style_array.first.text).to eq("Number of paragraph elements at this point: \t0\rNumber of paragraph elements after we added a text run: \t1")
  end

  it 'ApiDocument | CreateNumbering method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/createnumbering.js')
    ilvl = 0
    docx.elements[1..docx.elements.size].each do |current_element|
      expect(current_element.numbering.ilvl).to eq(ilvl.to_s)
      current_element.numbering.numbering_properties.ilvls.each do |current_lvl|
        expect(current_lvl.num_format).to eq('bullet')
      end
      ilvl += 1
    end
  end

  it 'ApiDocument | CreateSection method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/createsection.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is a new paragraph.')
    expect(docx.elements.first.character_style_array[3].text).to eq('Scroll down to see the new section.')
  end

  it 'ApiDocument | CreateStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/createstyle.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is a heading with a style created above')
    expect(docx.elements.first.character_style_array[1].size).to eq(20)
    expect(docx.elements.first.character_style_array[1].font).to eq('Calibri Light')
    expect(docx.elements.first.character_style_array[1].font_color).to eq(OoxmlParser::Color.new(255, 104, 0))
    expect(docx.elements[1].character_style_array[1].size).to eq(11)
    expect(docx.elements[1].character_style_array[1].font).to eq('Arial')
    expect(docx.elements[1].character_style_array[1].font_color).to eq(OoxmlParser::Color.new)
  end

  it 'ApiDocument | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getclasstype.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('Class Type = document')
  end

  it 'ApiDocument | GetDefaultParaPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getdefaultparapr.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is just a text.')
  end

  it 'ApiDocument | GetDefaultStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getdefaultstyle.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is just a text.')
    expect(docx.elements.first.spacing.line).to eq(1.0)
  end

  it 'ApiDocument | GetDefaultTextPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getdefaulttextpr.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is just a text.')
    expect(docx.elements.first.character_style_array[1].font).to eq('Comic Sans MS')
    expect(docx.elements.first.character_style_array[1].size).to eq(15)
  end

  it 'ApiDocument | GetElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getelement.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is just a sample text. Nothing special.')
  end

  it 'ApiDocument | GetElementsCount method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getelementscount.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('Number of document elements at this point: ')
    expect(docx.elements.first.character_style_array[2].text).to eq("\t")
    expect(docx.elements.first.character_style_array[3].text).to eq('1')
    expect(docx.elements[1].character_style_array[0].text).to eq('Now we add one more paragraph and push it.')
    expect(docx.elements[2].character_style_array[0].text).to eq('Number of document elements after we added the second paragraph ')
    expect(docx.elements[2].character_style_array[1].text).to eq('but before we push the third one: ')
    expect(docx.elements[2].character_style_array[2].text).to eq("\t")
    expect(docx.elements[2].character_style_array[3].text).to eq('2')
  end

  it 'ApiDocument | GetFinalSection method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getfinalsection.js')
    expect(docx.notes.first.elements.first.character_style_array[1].text).to eq('This is the text in the default header')
    expect(docx.notes.first.type).to eq('header1')
    expect(docx.notes.first.assigned_to).to eq('default')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is a text in a paragraph.')
  end

  it 'ApiDocument | GetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getstyle.js')
    expect(docx.elements.first.style.name).to eq('Heading 6')
    expect(docx.elements.first.character_style_array[1].text).to eq("This is a text in a paragraph styled with the 'Heading 6' style.")
  end

  it 'ApiDocument | Push method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/push.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is paragraph #0, you must not push it to take effect.')
    docx.elements[1..docx.elements.size].each_with_index do |current_element, index|
      expect(current_element.character_style_array.first.text).to eq("This is paragraph ##{index + 1}, you must push it to take effect.")
    end
  end

  it 'ApiDocument | RemoveAllElements method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/removeallelements.js')
    expect(docx.elements.first.character_style_array.first.text).to eq('This is the first paragraph. ')
  end

  it 'ApiDocument | RemoveElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/removeelement.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is paragraph #1.')
    expect(docx.elements[1].character_style_array.first.text).to eq('This is paragraph #2.')
    expect(docx.elements[2].character_style_array.first.text).to eq('This is paragraph #4.')
    expect(docx.elements[3].character_style_array.first.text).to eq('This is paragraph #5.')
    expect(docx.elements[4].character_style_array.first.text).to eq('We removed paragraph #3, check that out above.')
  end

  it 'ApiDocument | SetEvenAndOddHdrFtr method' do
    pending 'Add some functional to parser'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/setevenandoddhdrftr.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is section #1 of the document. ')
    expect(docx.elements.first.character_style_array[2].text).to eq('It has a header and a footer for odd pages. ')
    expect(docx.elements.first.character_style_array[3].text).to eq('Scroll down to see the other pages.')
    expect(docx.elements.first.sector_properties.notes.first.elements.first.character_style_array[1].text).to eq('This is an odd page header')
    expect(docx.elements.first.sector_properties.notes.first.type).to eq('header1')
    expect(docx.elements.first.sector_properties.notes[1].type).to eq('footer1')
    expect(docx.elements.first.sector_properties.notes[1].elements.first.character_style_array[1].text).to eq('This is an odd page footer')

    expect(docx.elements[1].sector_properties.notes.first.elements.first.character_style_array[1].text).to eq('This is an even page header')
    expect(docx.elements[1].character_style_array.first.text).to eq('This is section #2 of the document. ')
    expect(docx.elements[1].character_style_array[1].text).to eq('It has a header and a footer for even pages. ')
    expect(docx.elements[1].character_style_array[2].text).to eq('Scroll down to see the other pages.')
    expect(docx.elements[1].sector_properties.notes[1].type).to eq('footer2')
    expect(docx.elements[1].sector_properties.notes.first.type).to eq('header2')
    expect(docx.elements[1].sector_properties.notes[1].elements.first.character_style_array[1].text).to eq('This is an even page footer')

    expect(docx.elements[3].character_style_array.first.text).to eq('This is section #3 of the document. ')
    expect(docx.elements[3].character_style_array[1].text).to eq('It has a header and a footer for odd pages. ')
    expect(docx.elements[3].character_style_array[2].text).to eq('Scroll down to see the other pages.')
    expect(docx.elements[3].sector_properties.notes[1].type).to eq('footer2')
    expect(docx.elements[3].sector_properties.notes.first.type).to eq('header1')
    expect(docx.elements[3].sector_properties.notes[1].elements.first.character_style_array[1].text).to eq('This is an even page footer')
  end
end

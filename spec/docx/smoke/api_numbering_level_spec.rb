require 'spec_helper'
describe 'ApiNumberingLevel section tests' do
  it 'ApiNumberingLevel | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/getclasstype.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('Class Type = numberingLevel')
  end

  it 'ApiNumberingLevel | GetLevelIndex method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/getlevelindex.js')
    expect(docx.elements[3].character_style_array.first.text).to eq('Level index for the parent numbered list = 0')
    expect(docx.elements[4].character_style_array.first.text).to eq('Level index for the element of a child numbered list  = 1')
  end

  it 'ApiNumberingLevel | GetNumbering method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/getnumbering.js')

    expect(docx.elements[0].character_style_array[1].text).to eq("This is the first element of a parent numbered list which starts with '1'")
    expect(docx.elements[0].numbering.ilvl).to eq(0)
    expect(docx.elements[0].numbering.abstruct_numbering.multilevel_type.value).to eq(:hybrid_multi_level)

    expect(docx.elements[1].character_style_array.first.text).to eq("This is the first element of a child numbered list which starts with 'a'")
    expect(docx.elements[1].numbering.ilvl).to eq(1)
    expect(docx.elements[1].numbering.abstruct_numbering.multilevel_type.value).to eq(:hybrid_multi_level)

    expect(docx.elements[2].character_style_array.first.text).to eq("This is the second element of a child numbered list which starts with 'b'")
    expect(docx.elements[2].numbering.ilvl).to eq(1)
    expect(docx.elements[2].numbering.abstruct_numbering.multilevel_type.value).to eq(:hybrid_multi_level)

    expect(docx.elements[3].character_style_array.first.text).to eq('This is a paragraph without a numbering. ')
    expect(docx.elements[3].numbering.nil?).to be_truthy

    expect(docx.elements[4].character_style_array.first.text).to eq("This is the second element of a parent numbered list which starts with '2'")
    expect(docx.elements[4].numbering.ilvl).to eq(0)
    expect(docx.elements[4].numbering.abstruct_numbering.multilevel_type.value).to eq(:hybrid_multi_level)
  end

  it 'ApiNumberingLevel | GetParaPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/getparapr.js')
    expect(docx.elements.first.numbering.ilvl).to eq(0)
    expect(docx.elements.first.character_style_array[1].text).to eq("This is the first element of a parent numbered list which starts with '1'")
    expect(docx.elements[1].character_style_array.first.text).to eq("This is the second element of a parent numbered list which starts with '2'")
    expect(docx.elements[1].numbering.ilvl).to eq(0)
  end

  it 'ApiNumberingLevel | GetTextPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/gettextpr.js')
    expect(docx.elements.first.numbering.abstruct_numbering.level_list.first.run_properties.font_name).to eq('Calibri')
    expect(docx.elements.first.numbering.abstruct_numbering.level_list.first.run_properties.size.value).to eq(28)
  end

  it 'ApiNumberingLevel | SetCustomType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/setcustomtype.js')
    iterator = 0.6
    docx.elements[1..docx.elements.size].each do |current_element|
      expect(current_element.character_style_array.first.text).to eq("Custom numbered lvl #{iterator.round}")
      expect(current_element.numbering.abstruct_numbering.level_list.first.numbering_format.value).to eq('lowerRoman')
      expect(current_element.numbering.abstruct_numbering.level_list.first.justification.value).to eq('left')
      iterator += 0.5
    end
  end

  it 'ApiNumberingLevel | SetRestart method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/setrestart.js')
    expect(docx.elements.first.numbering.ilvl).to eq(0)
    expect(docx.elements[1].numbering.ilvl).to eq(1)
    expect(docx.elements[4].numbering.ilvl).to eq(1)
  end

  it 'ApiNumberingLevel | SetStart method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/setstart.js')
    expect(docx.elements[0].numbering.abstruct_numbering.level_list[1].start.value).to eq(5)
  end

  it 'ApiNumberingLevel | SetSuff method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/setsuff.js')
    expect(docx.element_by_description.first.numbering.abstruct_numbering.level_list.first.suffix.value).to eq(:space)
  end

  it 'ApiNumberingLevel | SetTemplateType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumberingLevel/settemplatetype.js')
    expect(docx.elements[0].numbering.abstruct_numbering.level_list.first.numbering_format.value).to eq('upperLetter')
  end
end

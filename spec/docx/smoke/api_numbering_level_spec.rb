# frozen_string_literal: true

require 'spec_helper'
describe 'ApiNumberingLevel section tests' do
  it 'ApiNumberingLevel | GetClassType method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_numbering_level/get_class_type.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = numberingLevel')
  end

  it 'ApiNumberingLevel | GetLevelIndex method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_numbering_level/get_level_index.js')
    expect(docx.elements[3].nonempty_runs.first.text).to eq('Level index for the parent numbered list = 0')
    expect(docx.elements[4].nonempty_runs.first.text).to eq('Level index for the element of a child numbered list  = 1')
  end

  it 'ApiNumberingLevel | GetNumbering method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_numbering_level/get_numbering.js')

    expect(docx.elements[0].nonempty_runs.first.text).to eq("This is the first element of a parent numbered list which starts with '1'")
    expect(docx.elements[0].numbering.ilvl).to eq(0)
    expect(docx.elements[0].numbering.abstruct_numbering.multilevel_type.value).to eq(:hybrid_multi_level)

    expect(docx.elements[1].nonempty_runs.first.text).to eq("This is the first element of a child numbered list which starts with 'a'")
    expect(docx.elements[1].numbering.ilvl).to eq(1)
    expect(docx.elements[1].numbering.abstruct_numbering.multilevel_type.value).to eq(:hybrid_multi_level)

    expect(docx.elements[2].nonempty_runs.first.text).to eq("This is the second element of a child numbered list which starts with 'b'")
    expect(docx.elements[2].numbering.ilvl).to eq(1)
    expect(docx.elements[2].numbering.abstruct_numbering.multilevel_type.value).to eq(:hybrid_multi_level)

    expect(docx.elements[3].nonempty_runs.first.text).to eq('This is a paragraph without a numbering. ')
    expect(docx.elements[3].numbering).to be_nil

    expect(docx.elements[4].nonempty_runs.first.text).to eq("This is the second element of a parent numbered list which starts with '2'")
    expect(docx.elements[4].numbering.ilvl).to eq(0)
    expect(docx.elements[4].numbering.abstruct_numbering.multilevel_type.value).to eq(:hybrid_multi_level)
  end

  it 'ApiNumberingLevel | GetParaPr method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_numbering_level/get_para_pr.js')
    expect(docx.elements.first.numbering.ilvl).to eq(0)
    expect(docx.elements.first.nonempty_runs.first.text).to eq("This is the first element of a parent numbered list which starts with '1'")
    expect(docx.elements[1].nonempty_runs.first.text).to eq("This is the second element of a parent numbered list which starts with '2'")
    expect(docx.elements[1].numbering.ilvl).to eq(0)
  end

  it 'ApiNumberingLevel | GetTextPr method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_numbering_level/get_text_pr.js')
    expect(docx.elements.first.numbering.abstruct_numbering.level_list.first.run_properties.font_name).to eq('Calibri')
    expect(docx.elements.first.numbering.abstruct_numbering.level_list.first.run_properties.size.value).to eq(28)
  end

  it 'ApiNumberingLevel | SetCustomType method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_numbering_level/set_custom_type.js')
    iterator = 0.6
    docx.elements[1..docx.elements.size].each do |current_element|
      expect(current_element.nonempty_runs.first.text).to eq("Custom numbered lvl #{iterator.round}")
      expect(current_element.numbering.abstruct_numbering.level_list.first.numbering_format.value).to eq('lowerRoman')
      expect(current_element.numbering.abstruct_numbering.level_list.first.justification.value).to eq('left')
      iterator += 0.5
    end
  end

  it 'ApiNumberingLevel | SetRestart method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_numbering_level/set_restart.js')
    expect(docx.elements.first.numbering.ilvl).to eq(0)
    expect(docx.elements[1].numbering.ilvl).to eq(1)
    expect(docx.elements[4].numbering.ilvl).to eq(1)
  end

  it 'ApiNumberingLevel | SetStart method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_numbering_level/set_start.js')
    expect(docx.elements[0].numbering.abstruct_numbering.level_list[1].start.value).to eq(5)
  end

  it 'ApiNumberingLevel | SetSuff method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_numbering_level/set_suff.js')
    expect(docx.element_by_description.first.numbering.abstruct_numbering.level_list.first.suffix.value).to eq(:space)
  end

  it 'ApiNumberingLevel | SetTemplateType method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_numbering_level/set_template_type.js')
    expect(docx.elements[0].numbering.abstruct_numbering.level_list.first.numbering_format.value).to eq('upperLetter')
  end
end

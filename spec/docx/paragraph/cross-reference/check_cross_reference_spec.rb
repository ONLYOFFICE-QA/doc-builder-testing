# frozen_string_literal: true

require 'spec_helper'
describe 'All tests numbering object' do
  it 'check cross-reference to numbering paragraphs' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/cross_reference/add_numbered_cross_reference.js')
    first_reference = docx.elements[1].character_style_array[1].name
    second_reference = docx.elements[2].character_style_array[1].name
    expect(docx.elements[3].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[4].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[5].nonempty_runs[1].text).to eq('1.2')
    expect(docx.elements[6].nonempty_runs[1].text).to eq('1.*1.2')
    expect(docx.elements[7].nonempty_runs.first.text).to eq('Numbered paragraph lvl 1')
    expect(docx.elements[8].nonempty_runs.first.text).to eq('above')
    expect(docx.elements[3].runs[1].instruction_text.value).to include(first_reference)
    expect(docx.elements[4].runs[1].instruction_text.value).to include(first_reference)
    expect(docx.elements[7].runs[1].instruction_text.value).to include(first_reference)
    expect(docx.elements[5].runs[1].instruction_text.value).to include(second_reference)
    expect(docx.elements[6].runs[1].instruction_text.value).to include(second_reference)
  end

  it 'check cross-reference to heading' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/cross_reference/add_heading_cross_reference.js')
    reference = docx.elements[0].character_style_array[1].name
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Heading 1')
    expect(docx.elements[2].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[3].nonempty_runs[1].text).to eq('0')
    expect(docx.elements[4].nonempty_runs.first.text).to eq('above')
    (1..4).each do |a|
      expect(docx.elements[a].runs[1].instruction_text.value).to include(reference)
    end
  end

  it 'check cross-reference to bookmarks' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/cross_reference/add_bookmark_cross_reference.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Paragraph')
    # expect(docx.elements[2].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[3].nonempty_runs[1].text).to eq('0')
    expect(docx.elements[4].nonempty_runs.first.text).to eq('above')
    (1..4).each do |a|
      expect(docx.elements[a].runs[1].instruction_text.value).to include('Bookmark')
    end
  end
end

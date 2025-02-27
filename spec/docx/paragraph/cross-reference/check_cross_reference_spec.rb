# frozen_string_literal: true

require 'spec_helper'
describe 'All tests numbering object' do
  it 'Cross-reference to numbering paragraphs' do
    docx = builder.build_and_parse('js/docx/paragraph/cross_reference/add_numbered_cross_ref.js')
    # TODO: 'check after release'
    index = builder.semver >= Semantic::Version.new('8.3.0') ? 3 : 2
    # TODO: bug 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=58290'
    # expect(docx.elements[3].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[3].runs[index].instruction_text.value).to eq(' PAGEREF _Ref1 \\h')
    expect(docx.elements[4].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[4].runs[index].instruction_text.value).to eq(' REF _Ref1 \\r  \\h')
    expect(docx.elements[5].nonempty_runs[1].text).to eq('1.2')
    expect(docx.elements[5].runs[index].instruction_text.value).to eq(' REF _Ref2 \\n  \\h')
    expect(docx.elements[6].nonempty_runs[1].text).to eq('1.*1.2')
    expect(docx.elements[6].runs[index].instruction_text.value).to eq(' REF _Ref2 \\w  \\h \\d *')
    expect(docx.elements[7].nonempty_runs[1].text).to eq('Numbered paragraph lvl 1')
    expect(docx.elements[7].runs[index].instruction_text.value).to eq(' REF _Ref1  \\h')
    expect(docx.elements[8].nonempty_runs[1].text).to eq('above')
    expect(docx.elements[8].runs[index].instruction_text.value).to eq(' REF _Ref1 \p  \h')
  end

  it 'Cross-reference to heading' do
    docx = builder.build_and_parse('js/docx/paragraph/cross_reference/add_heading_cross_ref.js')
    expect(docx.elements[1].nonempty_runs[1].text).to eq('Heading 1')
    # TODO: 'check after release'
    index = builder.semver >= Semantic::Version.new('8.3.0') ? 3 : 2
    # TODO: bug 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=58290'
    # expect(docx.elements[2].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[1].runs[index].instruction_text.value).to eq(' REF _Ref1  \\h')
    expect(docx.elements[2].runs[index].instruction_text.value).to eq(' PAGEREF _Ref1 \\h')
    expect(docx.elements[3].nonempty_runs[1].text).to eq('0')
    expect(docx.elements[3].runs[index].instruction_text.value).to eq(' REF _Ref1 \\r  \\h \\p')
    expect(docx.elements[4].nonempty_runs[1].text).to eq('above')
    expect(docx.elements[4].runs[index].instruction_text.value).to eq(' REF _Ref1 \\p  \\h')
  end

  it 'Cross-reference to bookmarks' do
    docx = builder.build_and_parse('js/docx/paragraph/cross_reference/add_bookmark_cross_ref.js')
    expect(docx.elements[1].nonempty_runs[1].text).to eq('Paragraph')
    # TODO: 'check after release'
    index = builder.semver >= Semantic::Version.new('8.3.0') ? 2 : 1
    expect(docx.elements[1].runs[index].instruction_text.value).to eq(' REF Bookmark  \\h')
    expect(docx.elements[2].runs[index].instruction_text.value).to eq(' PAGEREF Bookmark \\h')
    expect(docx.elements[3].runs[index].instruction_text.value).to eq(' REF Bookmark \\r  \\h')

    # TODO: bug 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=58290'
    # expect(docx.elements[2].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[3].nonempty_runs[1].text).to eq('0')
    expect(docx.elements[4].nonempty_runs.first.text).to eq('above')
    expect(docx.elements[4].runs[index].instruction_text.value).to eq(' REF Bookmark \\p  \\h')
  end

  it 'Cross-reference to footnote' do
    docx = builder.build_and_parse('js/docx/paragraph/cross_reference/add_footnote_cross_ref.js')
    expect(docx.elements[1].nonempty_runs[1].text).to eq('1')
    # TODO: 'check after release'
    index = builder.semver >= Semantic::Version.new('8.3.0') ? 3 : 2
    # TODO: bug 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=58290'
    # expect(docx.elements[2].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[1].runs[index].instruction_text.value).to eq(' NOTEREF _Ref1 \\h')
    expect(docx.elements[2].runs[index].instruction_text.value).to eq(' PAGEREF _Ref2 \\h')
    expect(docx.elements[3].nonempty_runs[1].text).to eq('above')
    expect(docx.elements[3].runs[index].instruction_text.value).to eq(' NOTEREF _Ref1 \\p  \\h')
    expect(docx.elements[4].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[4].nonempty_runs[1].run_properties.vertical_align.to_s).to eq('superscript')
    expect(docx.elements[4].runs[index].instruction_text.value).to eq(' NOTEREF _Ref1 \\f  \\h')
  end

  it 'Cross-reference to endnote' do
    docx = builder.build_and_parse('js/docx/paragraph/cross_reference/add_endnote_cross_ref.js')
    # TODO: 'check after release'
    index = builder.semver >= Semantic::Version.new('8.3.0') ? 3 : 2
    # TODO: bug 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=58902'
    # expect(docx.elements[1].nonempty_runs[1].text).to eq('i')
    expect(docx.elements[1].runs[index].instruction_text.value).to eq(' NOTEREF _Ref1 \\h')
    # expect(docx.elements[2].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[2].runs[index].instruction_text.value).to eq(' PAGEREF _Ref2 \\h')
    expect(docx.elements[3].nonempty_runs[1].text).to eq('above')
    expect(docx.elements[3].runs[index].instruction_text.value).to eq(' NOTEREF _Ref1 \\p  \\h')
    # expect(docx.elements[4].nonempty_runs[1].text).to eq('i')
    expect(docx.elements[4].nonempty_runs[1].run_properties.vertical_align.to_s).to eq('superscript')
    expect(docx.elements[4].runs[index].instruction_text.value).to eq(' NOTEREF _Ref1 \\f  \\h')
  end

  it 'Cross-reference to caption' do
    docx = builder.build_and_parse('js/docx/paragraph/cross_reference/add_caption_cross_ref.js')
    expect(docx.elements[3].nonempty_runs[3].text).to eq(' caption with text ')
    expect((1..2).map { |i| docx.elements[4].nonempty_runs[i].text }.join(' ')).to eq('Table  1')
    expect(docx.elements[5].nonempty_runs[1].text).to eq('caption with text ')
    # TODO: bug 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=58290'
    # expect(docx.elements[6].nonempty_runs[1].text).to eq('1')
    expect(docx.elements[7].nonempty_runs[1].text).to eq('above')
    expect(docx.elements[8].nonempty_runs[1].text).to eq('true')
  end
end

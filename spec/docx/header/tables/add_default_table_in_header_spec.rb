# frozen_string_literal: true

require 'spec_helper'

describe 'Add deafult table in header' do
  it 'Default table in footer' do
    docx = builder.build_and_parse('asserts/js/docx/header/tables/add_table_in_header.js')
    expect(docx.notes.first.elements[1].rows.length).to eq(3)
  end

  it 'Table with right alignment' do
    docx = builder.build_and_parse('asserts/js/docx/header/tables/add_table_in_header_right.js')
    expect(docx.notes.first.elements[1].rows.length).to eq(3)
    expect(docx.notes.first.elements[1].properties.jc).to eq(:right)
  end
end

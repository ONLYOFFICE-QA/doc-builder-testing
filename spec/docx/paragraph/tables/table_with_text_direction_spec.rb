# frozen_string_literal: true

require 'spec_helper'

describe 'Add tables with different text direction' do
  it 'Table with text direction: Left To Right' do
    docx = builder.build_and_parse('js/docx/paragraph/tables/table_with_textdirection_ltr.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows[2].cells.first.elements.first.nonempty_runs.first.text).to eq('left to right')
    expect(docx.elements[1].rows[2].cells.first.properties.text_direction).to eq(:left_to_right_top_to_bottom)
  end

  it 'Table with text direction: Top To Bottom' do
    docx = builder.build_and_parse('js/docx/paragraph/tables/table_with_textdirection_ttb.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows[2].cells.first.elements.first.nonempty_runs.first.text).to eq('top to bottom')
    expect(docx.elements[1].rows[2].cells.first.properties.text_direction).to eq(:left_to_right_top_to_bottom)
  end

  it 'Table with text direction: Right To Left' do
    docx = builder.build_and_parse('js/docx/paragraph/tables/table_with_textdirection_rtl.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows[2].cells[1].elements.first.nonempty_runs.first.text).to eq('right to left')
    expect(docx.elements[1].rows[2].cells[1].properties.text_direction).to eq(:top_to_bottom_right_to_left)
  end

  it 'Table with text direction: Bottom To Top' do
    docx = builder.build_and_parse('js/docx/paragraph/tables/table_with_textdirection_btt.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows[2].cells[2].elements.first.nonempty_runs.first.text).to eq('bottom to top')
    expect(docx.elements[1].rows[2].cells[2].properties.text_direction).to eq(:bottom_to_top_left_to_right)
  end
end

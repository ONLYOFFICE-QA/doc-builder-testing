# frozen_string_literal: true

require 'spec_helper'

describe 'Add table with merge' do
  it 'Table with merge: 2:3 x 2x3' do
    docx = builder.build_and_parse('js/docx/paragraph/tables/table_with_merge.js')
    expect(docx.elements[1].rows.length).to eq(5)
    expect(docx.elements[1].rows[1].cells[1].elements.first.nonempty_runs.first.text).to eq('Merged cell')
    expect(docx.elements[1].rows[1].cells[1].properties.grid_span.value).to eq(2)
    expect(docx.elements[1].rows[1].cells[1].properties.grid_span.value).to eq(2)
  end
end

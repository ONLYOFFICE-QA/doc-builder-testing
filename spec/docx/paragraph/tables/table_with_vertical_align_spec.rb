# frozen_string_literal: true

require 'spec_helper'

describe 'Add tables with types of vertical align' do
  it 'Table with vertical align: Top' do
    docx = builder.build_and_parse('js/docx/paragraph/tables/table_with_verticalalign_top.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.first.elements.first.nonempty_runs.first.text).to eq('Top')
    expect(docx.elements[1].rows.first.cells.first.properties.vertical_align).to eq(:top)
  end

  it 'Table with vertical align: Center' do
    docx = builder.build_and_parse('js/docx/paragraph/tables/table_with_verticalalign_center.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.first.elements.first.nonempty_runs.first.text).to eq('Center')
    expect(docx.elements[1].rows.first.cells.first.properties.vertical_align).to eq(:center)
  end

  it 'Table with vertical align: Bottom' do
    docx = builder.build_and_parse('js/docx/paragraph/tables/table_with_verticalalign_bottom.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.first.elements.first.nonempty_runs.first.text).to eq('Bottom')
    expect(docx.elements[1].rows.first.cells.first.properties.vertical_align).to eq(:bottom)
  end
end

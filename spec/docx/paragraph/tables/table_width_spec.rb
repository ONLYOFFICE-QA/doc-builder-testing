# frozen_string_literal: true

require 'spec_helper'

describe 'Add tables with differnt types of width' do
  it 'Table with auto width' do
    docx = builder.build_and_parse('js/docx/paragraph/tables/table_with_width_auto.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].properties.table_width).to be_zero
  end

  it 'Table with width in percent' do
    docx = builder.build_and_parse('js/docx/paragraph/tables/table_with_width_percent.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].properties.table_width).to eq(OoxmlParser::OoxmlSize.new(100, :percent))
  end

  it 'Table with fixed layout' do
    docx = builder.build_and_parse('js/docx/paragraph/tables/table_with_fixed_layout.js')
    expect(docx.elements[1].rows.length).to eq(3)
    'Not finished'
  end
end

# frozen_string_literal: true

require 'spec_helper'
describe 'ApiParagraph SetTableLayout' do
  it 'ApiTablePr | SetTableLayout fixed value' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/table_layout/fixed.js')
    expect(docx.elements[1].properties.table_style
               .table_properties.table_layout.type).to eq(:fixed)
  end

  it 'ApiTablePr | SetTableLayout autofit value' do
    docx = builder.build_and_parse('js/docx/smoke/api_table_pr/table_layout/autofit.js')
    expect(docx.elements[1].properties.table_style
               .table_properties.table_layout.type).to eq(:autofit)
  end
end

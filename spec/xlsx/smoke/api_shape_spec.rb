# frozen_string_literal: true

require 'spec_helper'
describe 'ApiShape section tests' do
  it 'ApiShape | GetClassType method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_shape/get_class_type.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('shape')
  end

  it 'ApiShape | GetDocContent method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_shape/get_doc_content.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.runs).to be_empty
  end

  it 'ApiShape | SetVerticalTextAlign method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_shape/set_vertical_text_align.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.properties.anchor).to eq(:bottom)
  end
end

# frozen_string_literal: true

require 'spec_helper'
describe 'From Xlsx' do
  it 'All formats | From Xlsx to Xlsx' do
    xlsx = builder.build_and_parse('asserts/js/other_formats/addtext_xlsx.js')
    expect(xlsx).to be_with_data
  end

  it 'All formats | From Xlsx to Ods' do
    output_file = builder.build_file('asserts/js/other_formats/addtext_ods.js')
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'All formats | From Xlsx to Pdf' do
    output_file = builder.build_file('asserts/js/other_formats/addtext_pdf_from_xlsx.js')
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'All formats | From Xlsx to Csv' do
    output_file = builder.build_file('asserts/js/other_formats/addtext_csv.js')
    expect(builder).not_to be_file_empty(output_file)
  end
end

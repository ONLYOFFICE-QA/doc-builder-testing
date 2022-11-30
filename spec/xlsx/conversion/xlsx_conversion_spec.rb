# frozen_string_literal: true

require 'spec_helper'
describe 'From Xlsx', critical: true do
  it 'All formats | From Xlsx to Xlsx' do
    xlsx = builder.build_and_parse('asserts/js/conversion/xlsx_to_xlsx.js')
    expect(xlsx).to be_with_data
  end

  it 'All formats | From Xlsx to Ods' do
    output_file = builder.build_file('asserts/js/conversion/xlsx_to_ods.js')
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'All formats | From Xlsx to Pdf' do
    output_file = builder.build_file('asserts/js/conversion/xlsx_to_pdf.js')
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'All formats | From Xlsx to Csv' do
    output_file = builder.build_file('asserts/js/conversion/xlsx_to_csv.js')
    expect(builder).not_to be_file_empty(output_file)
  end
end

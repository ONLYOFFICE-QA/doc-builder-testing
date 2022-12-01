# frozen_string_literal: true

require 'spec_helper'
describe 'ApiWorksheet page orientation in pdf' do
  before do
    skip('pdfinfo is not supported on Windows') if Gem.win_platform?
  end

  it 'ApiWorksheet | SetPageOrientation method' do
    pdf = builder.build_and_parse('js/xlsx/smoke/api_worksheet/set_page_orientation.js')
    expect(pdf.page_size).to eq('Landscape A4')
  end

  it 'ApiWorksheet | PageOrientation property' do
    pdf = builder.build_and_parse('js/xlsx/smoke/api_worksheet/page_orientation_property.js')
    expect(pdf.page_size).to eq('Landscape A4')
  end
end

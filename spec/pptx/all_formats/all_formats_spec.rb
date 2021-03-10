# frozen_string_literal: true

require 'spec_helper'
describe 'All formats tests from Pptx' do
  it 'All formats | From Pptx to Pptx', critical: true do
    pptx = builder.build_and_parse('asserts/js/other_formats/addtext_pptx.js')
    expect(pptx).to be_with_data
  end

  it 'All formats | From Pptx to Odp' do
    output_file = builder.build_file('asserts/js/other_formats/addtext_odp.js')
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'All formats | From Pptx to Pdf', critical: true do
    output_file = builder.build_file('asserts/js/other_formats/addtext_pdf_from_pptx.js')
    expect(builder).not_to be_file_empty(output_file)
  end
end

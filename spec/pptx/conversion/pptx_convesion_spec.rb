# frozen_string_literal: true

require 'spec_helper'
describe 'Conversion tests from Pptx' do
  it 'Conversion | Pptx to Pptx', :critical do
    pptx = builder.build_and_parse('js/conversion/pptx/pptx_to_pptx.js')
    expect(pptx).to be_with_data
  end

  it 'Conversion | Pptx to Odp' do
    output_file = builder.build_file('js/conversion/pptx/pptx_to_odp.js')
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'Conversion | Pptx to Pdf', :critical do
    skip 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=71025'
    output_file = builder.build_file('js/conversion/pptx/pptx_to_pdf.js')
    expect(builder).not_to be_file_empty(output_file)
  end
end

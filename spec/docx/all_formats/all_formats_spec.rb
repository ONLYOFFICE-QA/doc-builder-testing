# frozen_string_literal: true

require 'spec_helper'
describe 'All formats tests from Docx' do
  it 'All formats | From Docx to Docx', critical: true do
    docx = builder.build_and_parse('asserts/js/other_formats/addtext_docx.js')
    expect(docx).to be_with_data
  end

  it 'All formats | From Docx to Odt' do
    output_file = builder.build_file('asserts/js/other_formats/addtext_odt.js')
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'All formats | From Docx to Pdf', critical: true do
    output_file = builder.build_file('asserts/js/other_formats/addtext_pdf_from_docx.js')
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'All formats | From Docx to Rtf', critical: true do
    output_file = builder.build_file('asserts/js/other_formats/addtext_rtf.js')
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'All formats | From Docx to Txt', critical: true do
    output_file = builder.build_file('asserts/js/other_formats/addtext_txt.js')
    expect(builder).not_to be_file_empty(output_file)
  end
end

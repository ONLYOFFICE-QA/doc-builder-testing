# frozen_string_literal: true

require 'spec_helper'
describe 'Conversion tests from Docx' do
  it 'Conversion | Docx to Docx', :critical do
    docx = builder.build_and_parse('js/conversion/docx/docx_to_docx.js')
    expect(docx).to be_with_data
  end

  it 'Conversion | Docx to Odt' do
    output_file = builder.build_file('js/conversion/docx/docx_to_odt.js')
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'Conversion | Docx to Pdf', :critical do
    skip 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=71025' if builder.semver >= Semantic::Version.new('8.2.0')
    output_file = builder.build_file('js/conversion/docx/docx_to_pdf.js')
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'Conversion | Docx to Rtf', :critical do
    output_file = builder.build_file('js/conversion/docx/docx_to_rtf.js')
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'Conversion | Docx to Txt', :critical do
    output_file = builder.build_file('js/conversion/docx/docx_to_txt.js')
    expect(builder).not_to be_file_empty(output_file)
  end
end

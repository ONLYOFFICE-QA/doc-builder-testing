require 'spec_helper'
describe 'All formats negative tests from Docx' do
  it 'All formats | From Docx to Xlsx' do
    expect { builder.build_doc_and_parse('asserts/js/other_formats/negative/addtext_xlsx_from_docx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Docx to Ods' do
    expect { builder.build_doc_and_parse('asserts/js/other_formats/negative/addtext_xlsx_from_docx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Docx to Csv' do
    expect { builder.build_doc_and_parse('asserts/js/other_formats/negative/addtext_csv_from_docx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Docx to Pptx' do
    expect { builder.build_doc_and_parse('asserts/js/other_formats/negative/addtext_pptx_from_docx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Docx to Odp' do
    pending 'http://bugzilla.onlyoffice.com/show_bug.cgi?id=36227'
    expect { builder.build_doc_and_parse('asserts/js/other_formats/negative/addtext_odp_from_docx.js') }.to raise_error(StandardError)
  end
end

# frozen_string_literal: true

require 'spec_helper'
describe 'All formats negative tests from Docx' do
  it 'All formats | From Docx to Xlsx' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_xlsx_from_docx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Docx to Ods' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_ods_from_docx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Docx to Csv' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_csv_from_docx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Docx to Pptx' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_pptx_from_docx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Docx to Odp' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_odp_from_docx.js') }.to raise_error(StandardError)
  end
end

# frozen_string_literal: true

require 'spec_helper'
describe 'All formats tests from Pptx negative' do
  it 'All formats | From Pptx to Docx' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_docx_from_pptx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Pptx to Odt' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_odt_from_pptx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Pptx to Txt' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_txt_from_pptx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Pptx to Rtf' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_rtf_from_pptx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Pptx to Xlsx' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_xlsx_from_pptx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Pptx to Ods' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_ods_from_pptx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Pptx to Csv' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_csv_from_pptx.js') }.to raise_error(StandardError)
  end
end

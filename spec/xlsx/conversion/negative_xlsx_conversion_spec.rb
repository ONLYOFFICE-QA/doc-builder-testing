# frozen_string_literal: true

require 'spec_helper'
describe 'From Xlsx negative' do
  it 'All formats | From Xlsx to Docx' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_docx_from_xlsx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Xlsx to Odt' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_odt_from_xlsx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Xlsx to Txt' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_txt_from_xlsx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Xlsx to Rtf' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_rtf_from_xlsx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Xlsx to Pptx' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_pptx_from_xlsx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Xlsx to Odp' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/addtext_odp_from_xlsx.js') }.to raise_error(StandardError)
  end
end

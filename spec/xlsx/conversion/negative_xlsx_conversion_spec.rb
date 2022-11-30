# frozen_string_literal: true

require 'spec_helper'
describe 'From Xlsx negative' do
  it 'All formats | From Xlsx to Docx' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/xlsx_to_docx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Xlsx to Odt' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/xlsx_to_odt.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Xlsx to Txt' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/xlsx_to_txt.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Xlsx to Rtf' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/xlsx_to_rtf.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Xlsx to Pptx' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/xlsx_to_pptx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Xlsx to Odp' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/xlsx_to_odp.js') }.to raise_error(StandardError)
  end
end

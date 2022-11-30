# frozen_string_literal: true

require 'spec_helper'
describe 'All formats tests from Pptx negative' do
  it 'All formats | From Pptx to Docx' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/pptx_to_docx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Pptx to Odt' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/pptx_to_odt.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Pptx to Txt' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/pptx_to_rtf.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Pptx to Rtf' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/pptx_to_rtf.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Pptx to Xlsx' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/pptx_to_xlsx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Pptx to Ods' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/pptx_to_ods.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Pptx to Csv' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/pptx_to_csv.js') }.to raise_error(StandardError)
  end
end

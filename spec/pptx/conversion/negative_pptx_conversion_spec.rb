# frozen_string_literal: true

require 'spec_helper'
describe 'Conversion tests from Pptx negative' do
  it 'Conversion | Pptx to Docx' do
    expect { builder.build_and_parse('js/conversion/negative/pptx/pptx_to_docx.js') }.to raise_error(StandardError)
  end

  it 'Conversion | Pptx to Odt' do
    expect { builder.build_and_parse('js/conversion/negative/pptx/pptx_to_odt.js') }.to raise_error(StandardError)
  end

  it 'Conversion | Pptx to Txt' do
    expect { builder.build_and_parse('js/conversion/negative/pptx/pptx_to_txt.js') }.to raise_error(StandardError)
  end

  it 'Conversion | Pptx to Rtf' do
    expect { builder.build_and_parse('js/conversion/negative/pptx/pptx_to_rtf.js') }.to raise_error(StandardError)
  end

  it 'Conversion | Pptx to Xlsx' do
    expect { builder.build_and_parse('js/conversion/negative/pptx/pptx_to_xlsx.js') }.to raise_error(StandardError)
  end

  it 'Conversion | Pptx to Ods' do
    expect { builder.build_and_parse('js/conversion/negative/pptx/pptx_to_ods.js') }.to raise_error(StandardError)
  end

  it 'Conversion | Pptx to Csv' do
    expect { builder.build_and_parse('js/conversion/negative/pptx/pptx_to_csv.js') }.to raise_error(StandardError)
  end
end

# frozen_string_literal: true

require 'spec_helper'
describe 'All formats negative tests from Docx' do
  it 'All formats | From Docx to Xlsx' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/docx/docx_to_xlsx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Docx to Ods' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/docx/docx_to_ods.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Docx to Csv' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/docx/docx_to_csv.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Docx to Pptx' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/docx/docx_to_pptx.js') }.to raise_error(StandardError)
  end

  it 'All formats | From Docx to Odp' do
    expect { builder.build_and_parse('asserts/js/conversion/negative/docx/docx_to_odp.js') }.to raise_error(StandardError)
  end
end

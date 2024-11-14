# frozen_string_literal: true

require 'spec_helper'
describe 'Presentation Run Api regression' do
  it 'GetTextPr | 67269' do
    pptx = builder.build_and_parse('js/pptx/regression/api_run/67269.js')
    expect(JSON.parse(pptx.slides[1].elements.first.text_body.paragraphs.first.runs.first.text)).to hash_have_no_empty_string_values
  end
end

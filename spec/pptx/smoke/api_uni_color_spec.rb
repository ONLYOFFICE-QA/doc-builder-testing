# frozen_string_literal: true

require 'spec_helper'
describe 'ApiUniColor section tests' do
  it 'ApiUniColor | GetClassType method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_uni_color/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq('Class Type = presetColor')
  end
end

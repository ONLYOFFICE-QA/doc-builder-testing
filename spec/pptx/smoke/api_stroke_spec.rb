# frozen_string_literal: true

require 'spec_helper'
describe 'ApiStroke section tests' do
  it 'ApiStroke | GetClassType method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_stroke/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq('Class Type = stroke')
  end
end

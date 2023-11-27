# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRGBColor section tests' do
  it 'ApiRGBColor | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = rgbColor')
  end

  it 'ApiRGBColor | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/to_json.js')
    first_paragraph_text = docx.elements[0].nonempty_runs.first.text
    third_paragraph_text = docx.elements[1].nonempty_runs.first.text
    expect(third_paragraph_text).to include(first_paragraph_text)
  end
end

# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRGBColor section tests' do
  it 'ApiRGBColor | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = rgbColor')
  end

  it 'ApiRGBColor | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/to_json.js')
    first_paragraph_json = JSON.parse(docx.elements[0].nonempty_runs.first.text)
    expect(first_paragraph_json['color']['rgba']['red']).to eq(255)
    expect(first_paragraph_json['color']['rgba']['green']).to eq(111)
    expect(first_paragraph_json['color']['rgba']['blue']).to eq(61)
  end
end

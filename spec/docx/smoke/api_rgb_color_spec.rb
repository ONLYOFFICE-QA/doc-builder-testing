# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRGBColor section tests' do
  it 'ApiRGBColor | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = rgbColor')
  end

  it 'ApiRGBColor | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/to_json.js')
    json = JSON.parse(docx.elements[1].nonempty_runs.first.text)
    rgba = json['graphic']['spPr']['fill']['fill']['gsLst'][0]['color']['color']['rgba']
    expect(rgba['red']).to eq(255)
    expect(rgba['green']).to eq(111)
    expect(rgba['blue']).to eq(61)
  end
end

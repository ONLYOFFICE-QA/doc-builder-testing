# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRGBColor section tests' do
  it 'ApiRGBColor | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = rgbColor')
  end

  it 'ApiRGBColor | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/to_json.js')
    rgba = JSON.parse(docx.elements[1].nonempty_runs.first.text)
    lst = rgba['graphic']['spPr']['fill']['fill']['gsLst'][1]['color']['color']['rgba']
    expect(lst['red']).to eq(255)
    expect(lst['green']).to eq(111)
    expect(lst['blue']).to eq(61)
  end
end

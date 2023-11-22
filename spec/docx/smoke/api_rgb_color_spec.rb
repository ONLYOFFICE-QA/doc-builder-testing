# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRGBColor section tests' do
  it 'ApiRGBColor | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = rgbColor')

  end

  it 'ApiRGBColor | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/to_json.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = rgbColor')
    json = JSON.parse(docx.elements[0].nonempty_runs.first.text)
    color_from_json = json['graphic']['spPr']['fill']['fill']['gsLst'][1]['color']['color']['rgba']
    expected_color = [255, 164, 101] # Укажите ожидаемый цвет в формате RGBA
    expect(color_from_json).to eq(expected_color)
  end
end

# frozen_string_literal: true

require 'spec_helper'
describe 'ApiUniColor section tests' do
  it 'ApiUniColor | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_uni_color/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = presetColor')
  end

  it 'ApiUniColor | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_uni_color/to_json.js')
    json = JSON.parse(docx.elements[0].nonempty_runs.first.text)
    color_type = json['graphic']['spPr']['fill']['fill']['color']['type']
    rgba = json['graphic']['spPr']['fill']['fill']['color']['color']['rgba']
    expect(color_type).to eq('uniColor')
    expect(rgba['red']).to eq(255)
    expect(rgba['green']).to eq(111)
    expect(rgba['blue']).to eq(61)
  end
end

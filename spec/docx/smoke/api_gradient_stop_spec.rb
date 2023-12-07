# frozen_string_literal: true

require 'spec_helper'
describe 'ApiGradientStop section tests' do
  it 'ApiGradientStop | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_gradient_stop/get_class_type.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('Class Type = gradientStop')
  end

  it 'ApiGradientStop | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_gradient_stop/to_json.js')
    json = JSON.parse(docx.elements[1].nonempty_runs.first.text)
    grad_s = json['graphic']['spPr']['fill']['fill']['gsLst'][0]['type']
    grad_s1 = json['graphic']['spPr']['fill']['fill']['gsLst'][1]['type']
    grad = json['graphic']['spPr']['fill']['fill']['gsLst'][0]['color']['color']['rgba']
    grad1 = json['graphic']['spPr']['fill']['fill']['gsLst'][1]['color']['color']['rgba']
    expect(grad_s).to eq('gradStop')
    expect(grad_s1).to eq('gradStop')
    expect(grad['red']).to eq(255)
    expect(grad['green']).to eq(111)
    expect(grad['blue']).to eq(61)
    expect(grad1['red']).to eq(255)
    expect(grad1['green']).to eq(213)
    expect(grad1['blue']).to eq(191)
  end
end

# frozen_string_literal: true

require 'spec_helper'
describe 'ApiGradientStop section tests' do
  it 'ApiGradientStop | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_gradient_stop/get_class_type.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('Class Type = gradientStop')
  end

  it 'ApiGradientStop | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_gradient_stop/to_json.js')
    json_drawing = JSON.parse(docx.elements[0].runs[3].text)
    gs_list = json_drawing['graphic']['spPr']['fill']['fill']['gsLst']
    start = gs_list[0]['color']['color']['rgba']
    stop  = gs_list[1]['color']['color']['rgba']
    actual = [OoxmlParser::Color.new(start['red'], start['green'], start['blue']),
              OoxmlParser::Color.new(stop['red'], stop['green'], stop['blue'])]
    expected = [OoxmlParser::Color.new(255, 111, 61),
                OoxmlParser::Color.new(255, 213, 191)]
    expect(actual).to eq(expected)
  end
end

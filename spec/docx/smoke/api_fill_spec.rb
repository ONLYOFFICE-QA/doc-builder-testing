# frozen_string_literal: true

require 'spec_helper'
describe 'ApiFill section tests' do
  it 'ApiFill | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_fill/get_class_type.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('Class Type = fill')
  end

  it 'ApiFill | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_fill/to_json.js')
    json = JSON.parse(docx.elements[1].nonempty_runs.first.text)
    fill = json['graphic']['spPr']['fill']['fill']['gsLst'][0]['color']['color']['rgba']
    fill1 = json['graphic']['spPr']['fill']['fill']['gsLst'][1]['color']['color']['rgba']
    expect(fill['red']).to eq(255)
    expect(fill['green']).to eq(111)
    expect(fill['blue']).to eq(61)
    expect(fill1['red']).to eq(255)
    expect(fill1['green']).to eq(213)
    expect(fill1['blue']).to eq(191)
  end
end

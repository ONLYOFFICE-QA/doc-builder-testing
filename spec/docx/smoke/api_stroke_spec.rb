# frozen_string_literal: true

require 'spec_helper'
describe 'ApiStroke section tests' do
  it 'ApiStroke | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_stroke/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = stroke')
  end

  it 'ApiStroke | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_stroke/to_json.js')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.text_body.elements.first.character_style_array.size).to eq(2)
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.type).to eq(:shape)
    expect(docx.elements[1].nonempty_runs.first.text).to include('"type":"stroke"')
    stroke = JSON.parse(docx.elements[1].nonempty_runs.first.text)['graphic']['spPr']['ln']
    expect(stroke['w']).to be_a(Integer)
    expect(stroke['algn']).to be_nil
    expect(stroke['fill']['fill']['color']['color']['rgba']['red']).to eq(51)
    expect(stroke['fill']['fill']['color']['color']['rgba']['green']).to eq(51)
    expect(stroke['fill']['fill']['color']['color']['rgba']['blue']).to eq(51)
    expect(stroke['fill']['fill']['color']['color']['rgba']['alpha']).to eq(255)
    expect(stroke['fill']['fill']['type']).to eq('solid')
    expect(stroke['fill']['transparent']).to be_nil
    expect(stroke['transparent']).to be_nil
    expect(stroke['type']).to eq('stroke')
  end
end

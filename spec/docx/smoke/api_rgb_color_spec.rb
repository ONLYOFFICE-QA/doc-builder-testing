# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRGBColor section tests' do
  it 'ApiRGBColor | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = rgbColor')

  end


  it 'ApiRGBColor | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/to_json.js')
    p docx
    # expect(docx.paragraphs[0].text).to include(GlobalVariable['RGBColorJSON'])
    # json = JSON.parse(docx.elements[1].nonempty_runs.first.text)
    # expected_rgba = (GlobalVariable['RGBColorJSON'])['graphic']['spPr']['fill']['fill']['gsLst'][1]['color']['color']['rgba']
    # expect(json['graphic']['spPr']['fill']['fill']['gsLst'][1]['color']['color']['rgba']).to eq(expected_rgba)
  end

end

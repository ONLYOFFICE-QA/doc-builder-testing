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
    graphic = json['graphic']
    sp_pr = graphic['spPr'] if graphic
    fill_first = sp_pr['fill'] if sp_pr
    fill_second = fill_first['fill'] if fill_first
    color = fill_second['color'] if fill_second
    color_type = color['type'] if color
    expect(color_type).to eq('uniColor')
  end
end

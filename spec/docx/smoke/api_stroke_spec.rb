# frozen_string_literal: true

require 'spec_helper'
describe 'ApiStroke section tests' do
  it 'ApiStroke | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_stroke/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = stroke')
  end

  it 'ApiStroke | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_stroke/to_json.js')
    type = TestData.fill_types
    docx.elements[1..6].each_with_index do |el, i|
      json = JSON.parse(el.nonempty_runs.first.text)
      expect(type[i]).to eq(json['fill']['fill']['type'])
    end
  end
end

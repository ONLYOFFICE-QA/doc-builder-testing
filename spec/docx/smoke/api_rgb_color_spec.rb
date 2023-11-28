# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRGBColor section tests' do
  it 'ApiRGBColor | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = rgbColor')
  end

  it 'ApiRGBColor | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/to_json.js')
    expected_text = '{"rgba":{"red":0,"green":0,"blue":0,"alpha":255},"color":{"rgba":{"red":255,"green":111,"blue":61,"alpha":255},"type":"srgb"},"type":"uniColor"}'
    expected_json = JSON.parse(expected_text)
    third_paragraph_text = docx.elements[2].nonempty_runs.first.text
    third_paragraph_json = JSON.parse(third_paragraph_text)
    expect(third_paragraph_json).to include(expected_json)
  end
end

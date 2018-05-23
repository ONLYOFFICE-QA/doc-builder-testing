require 'spec_helper'
describe 'ApiPresetColor section tests' do
  it 'ApiPresetColor | GetClassType method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_preset_color/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq('Class Type = presetColor')
  end
end

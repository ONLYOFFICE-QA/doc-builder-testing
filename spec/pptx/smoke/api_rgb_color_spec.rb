require 'spec_helper'
describe 'ApiRgbColor section tests' do
  it 'ApiRgbColor | GetClassType method' do
    pptx = builder.build_doc_and_parse('asserts/js/pptx/smoke/api_rgb_color/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.runs.first.text).to eq('Class Type = rgbColor')
  end
end

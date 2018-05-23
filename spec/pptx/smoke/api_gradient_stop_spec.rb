require 'spec_helper'
describe 'ApiGradientStop section tests' do
  it 'ApiGradientStop | GetClassType method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_gradient_stop/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.last.characters.first.text).to eq('Class Type = gradientStop')
  end
end

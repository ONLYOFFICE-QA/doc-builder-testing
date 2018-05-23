require 'spec_helper'
describe 'ApiFill section tests' do
  it 'ApiFill | GetClassType method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_fill/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.last.characters.first.text).to eq('Class Type = fill')
  end
end

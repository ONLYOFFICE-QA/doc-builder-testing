require 'spec_helper'
describe 'ApiSchemeColor section tests' do
  it 'ApiSchemeColor | GetClassType method' do
    pptx = builder.build_and_parse('asserts/js/pptx/smoke/api_scheme_color/get_class_type.js')
    expect(pptx.slides.first.nonempty_elements.first.text_body.paragraphs.first.characters.first.text).to eq('Class Type = schemeColor')
  end
end

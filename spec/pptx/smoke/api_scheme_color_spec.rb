require 'spec_helper'
describe 'ApiSchemeColor section tests' do
  it 'ApiSchemeColor | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_scheme_color/get_class_type.js')
    expect(pptx.slides.first.elements.first.shape_properties.preset.name).to eq(:flowChartMagneticTape)
    expect(pptx.slides[0].nonempty_elements.first.text_body.paragraphs.first.characters.first.text).to eq('Class Type = schemeColor')
  end
end

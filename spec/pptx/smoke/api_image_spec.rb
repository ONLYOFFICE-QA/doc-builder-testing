require 'spec_helper'
describe 'ApiImage section tests' do
  it 'ApiImage | GetClassType method' do
    pptx = builder.build_doc_and_parse('asserts/js/pptx/smoke/api_image/get_class_type.js')
    expect(pptx.slides.first.elements.last.text_body.paragraphs.last.characters.first.text).to eq('Class Type = image')
  end
end

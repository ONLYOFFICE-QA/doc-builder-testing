require 'spec_helper'
describe 'ApiBullet section tests' do
  it 'ApiBullet | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_bullet/get_class_type.js')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.first.properties.numbering.symbol).to eq('-')
    expect(pptx.slides.first.elements.first.text_body.paragraphs.last.characters.first.text).to eq('Class Type = bullet')
  end
end

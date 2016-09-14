require 'spec_helper'
describe 'ApiBullet section tests' do
  it 'ApiBullet | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_bullet/get_class_type.js')
    expect(pptx).to be_with_data
  end
end

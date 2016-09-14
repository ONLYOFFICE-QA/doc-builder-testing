require 'spec_helper'
describe 'ApiDrawing section tests' do
  it 'ApiDrawing | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_drawing/get_class_type.js')
    expect(pptx).to be_with_data
  end

  it 'ApiDrawing | SetPosition method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_drawing/set_position.js')
    expect(pptx).to be_with_data
  end

  it 'ApiDrawing | SetSize method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_drawing/set_size.js')
    expect(pptx).to be_with_data
  end
end

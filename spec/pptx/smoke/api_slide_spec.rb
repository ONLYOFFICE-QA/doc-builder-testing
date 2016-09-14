require 'spec_helper'
describe 'ApiSlide section tests' do
  it 'ApiSlide | AddObject method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_slide/add_object.js')
    expect(pptx).to be_with_data
  end

  it 'ApiSlide | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_slide/get_class_type.js')
    expect(pptx).to be_with_data
  end

  it 'ApiSlide | GetHeight method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_slide/get_height.js')
    expect(pptx).to be_with_data
  end

  it 'ApiSlide | GetWidth method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_slide/get_width.js')
    expect(pptx).to be_with_data
  end

  it 'ApiSlide | RemoveAllObjects method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_slide/remove_all_objects.js')
    expect(pptx).to be_with_data
  end

  it 'ApiSlide | SetBackground method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_slide/set_background.js')
    expect(pptx).to be_with_data
  end
end

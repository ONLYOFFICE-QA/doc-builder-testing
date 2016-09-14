require 'spec_helper'
describe 'ApiPresentation section tests' do
  it 'ApiPresentation | AddSlide method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_presentation/add_slide.js')
    expect(pptx).to be_with_data
  end

  it 'ApiPresentation | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_presentation/get_class_type.js')
    expect(pptx).to be_with_data
  end

  it 'ApiPresentation | GetCurSlideIndex method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_presentation/get_cur_slide_index.js')
    expect(pptx).to be_with_data
  end

  it 'ApiPresentation | GetCurrentSlide method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_presentation/get_current_slide.js')
    expect(pptx).to be_with_data
  end

  it 'ApiPresentation | GetSlideByIndex method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_presentation/get_slide_by_index.js')
    expect(pptx).to be_with_data
  end

  it 'ApiPresentation | SetSizes method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_presentation/set_sizes.js')
    expect(pptx).to be_with_data
  end
end

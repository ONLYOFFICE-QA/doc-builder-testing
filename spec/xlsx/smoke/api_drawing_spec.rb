require 'spec_helper'
describe 'ApiDrawing section tests' do
  it 'ApiDrawing | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_drawing/get_class_type.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiDrawing | SetPosition method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_drawing/set_position.js')
    expect(xlsx).to be_with_data
  end

  it 'ApiDrawing | SetSize method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_drawing/set_size.js')
    expect(xlsx).to be_with_data
  end
end

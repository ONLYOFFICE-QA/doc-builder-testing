require 'spec_helper'
describe 'ApiChart section tests' do
  it 'ApiChart | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/ApiChart/getclasstype.js')
    chart = pptx.slides.first.elements.first.graphic_data.first.type
    expect(chart.to_s).to eq('bar_3d')
  end
end

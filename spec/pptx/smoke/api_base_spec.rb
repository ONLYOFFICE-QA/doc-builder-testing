require 'spec_helper'
describe 'Api section tests' do
  it 'Api | CreateBlipFill method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/Api/createblipfill.js')
    expect(pptx.slides.first.elements.first.non_visual_properties.non_visual_properties.placeholder.type).to eq(:ctrTitle)
    expect(pptx.slides.first.elements.first.non_visual_properties.common_properties.name.to_s).to eq("Title 1")
  end

  it 'Api | CreateChart method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/Api/createchart.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.type).to eq(:bar_3d)
    pptx.slides.first.elements.first.graphic_data.first.series.each do |series|
      expect(series.categories.string.cache.points.map { |current_point| current_point.text.value }).to eq(%w(2014 2015 2016))
    end
    expect(pptx.slides.first.elements.first.graphic_data.first.data.first.points
               .map { |current_point| current_point.value.to_s }).to eq(%w(200.0 240.0 280.0))
    expect(pptx.slides.first.elements.first.graphic_data.first.data.first.points
               .map { |current_point| current_point.value.to_s }).to eq(%w(200.0 240.0 280.0))
    expect(pptx.slides.first.elements.first.graphic_data.first.series.first.text.string.cache.points.first.text.value).to eq('Projected Revenue')
    expect(pptx.slides.first.elements.first.graphic_data.first.series.last.text.string.cache.points.first.text.value).to eq('Estimated Costs')
    expect(pptx.slides.first.elements.first.graphic_data.first.title.nil?).to be_truthy
    expect(pptx.slides.first.elements.first.graphic_data.first.alternate_content.office2007_content.style_number).to eq(24)
    expect(pptx.slides.first.elements.first.properties).to eq('Estimated Costs')
  end
end

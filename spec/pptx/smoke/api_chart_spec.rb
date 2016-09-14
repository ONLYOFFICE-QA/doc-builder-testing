require 'spec_helper'
describe 'ApiChart section tests' do
  it 'ApiChart | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_chart/get_class_type.js')
    chart = pptx.slides.first.elements.first.graphic_data.first.type
    expect(chart.to_s).to eq('bar_3d')
  end

  it 'Api | SetHorAxisTitle method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_chart/set_hor_axis_title.js')
    expect(pptx).to be_with_data
  end

  it 'Api | SetLegendPos method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_chart/set_legend_pos.js')
    expect(pptx).to be_with_data
  end

  it 'Api | SetShowDataLabels method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_chart/set_show_data_labels.js')
    expect(pptx).to be_with_data
  end

  it 'Api | SetTitle method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_chart/set_title.js')
    expect(pptx).to be_with_data
  end

  it 'Api | SetVerAxisTitle method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_chart/set_ver_axis_title.js')
    expect(pptx).to be_with_data
  end
end

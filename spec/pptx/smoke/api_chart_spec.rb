require 'spec_helper'
describe 'ApiChart section tests' do
  it 'ApiChart | GetClassType method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_chart/get_class_type.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.title.elements.first.runs.first.text).to eq('Financial Overview: Class Type = chart')
  end

  it 'Api | SetHorAxisTitle method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_chart/set_hor_axis_title.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.axises.first.title.elements.first.runs.first.text).to eq('Year')
    expect(pptx.slides.first.elements.first.graphic_data.first.axises.first.title.elements.first.runs.first.properties.font_size).to eq(11)
  end

  it 'Api | SetLegendPos method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_chart/set_legend_pos.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.legend.position).to eq(:bottom)
  end

  it 'Api | SetShowDataLabels method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_chart/set_show_data_labels.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.display_labels.show_values).to be true
    expect(pptx.slides.first.elements.first.graphic_data.first.display_labels.show_series_name).to be false
    expect(pptx.slides.first.elements.first.graphic_data.first.display_labels.show_category_name).to be false
  end

  it 'Api | SetTitle method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_chart/set_title.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.title.elements.first.runs.first.text).to eq('Financial Overview')
  end

  it 'Api | SetVerAxisTitle method' do
    pptx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/pptx/smoke/api_chart/set_ver_axis_title.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.axises.last.title.elements.first.runs.first.text).to eq('USD In Hundred Thousands')
    expect(pptx.slides.first.elements.first.graphic_data.first.axises.last.title.elements.first.runs.first.properties.font_size).to eq(10)
  end
end

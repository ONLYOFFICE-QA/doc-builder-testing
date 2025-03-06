# frozen_string_literal: true

require 'spec_helper'
describe 'ApiChart section tests' do
  before { skip('https://bugzilla.onlyoffice.com/show_bug.cgi?id=73379') if builder.semver > Semantic::Version.new('8.3.0') }

  it 'ApiChart | GetClassType method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_chart/get_class_type.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.title.elements.first.runs.first.text).to eq('Financial Overview: Class Type = chart')
  end

  it 'Api | SetHorAxisTitle method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_chart/set_hor_axis_title.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.axises.first.title.elements.first.runs.first.text).to eq('Year')
    expect(pptx.slides.first.elements.first.graphic_data.first.axises.first.title.elements.first.runs.first.properties.font_size).to eq(11)
  end

  it 'Api | SetLegendPos method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_chart/set_legend_pos.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.legend.position).to eq(:bottom)
  end

  it 'Api | SetShowDataLabels method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_chart/set_show_data_labels.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.display_labels.show_values).to be true
    expect(pptx.slides.first.elements.first.graphic_data.first.display_labels.show_series_name).to be false
    expect(pptx.slides.first.elements.first.graphic_data.first.display_labels.show_category_name).to be false
  end

  it 'Api | SetTitle method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_chart/set_title.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.title.elements.first.runs.first.text).to eq('Financial Overview')
  end

  it 'Api | SetVerAxisTitle method' do
    pptx = builder.build_and_parse('js/pptx/smoke/api_chart/set_ver_axis_title.js')
    expect(pptx.slides.first.elements.first.graphic_data.first.axises.last.title.elements.first.runs.first.text).to eq('USD In Hundred Thousands')
    expect(pptx.slides.first.elements.first.graphic_data.first.axises.last.title.elements.first.runs.first.properties.font_size).to eq(10)
  end
end

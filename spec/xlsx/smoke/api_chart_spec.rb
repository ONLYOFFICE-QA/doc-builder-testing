require 'spec_helper'
describe 'ApiChart section tests' do
  it 'ApiChart | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_chart/get_class_type.js')
    expect(xlsx.worksheets.first.rows.first.cells[6].text).to eq('chart')
    expect(xlsx.worksheets.first.drawings.first.picture.chart).to be_truthy
  end

  it 'ApiChart | SetHorAxisTitle method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_chart/set_hor_axis_title.js')
    expect(xlsx.worksheets.first.drawings.first.picture.chart.axises.first.title.elements.first.runs.first.text).to eq('Horizontal Title')
    expect(xlsx.worksheets.first.drawings.first.picture.chart.axises.first.title.elements.first.runs.first.properties.font_size).to eq(11.0)
  end

  it 'ApiChart | SetLegendPos method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_chart/set_legend_pos.js')
    expect(xlsx.worksheets.first.drawings.first.picture.chart.legend.position).to eq(:right)
  end

  it 'ApiChart | SetShowDataLabels method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_chart/set_show_data_labels.js')
    expect(xlsx.worksheets.first.drawings.first.picture.chart.display_labels.show_values).to be true
    expect(xlsx.worksheets.first.drawings.first.picture.chart.display_labels.show_series_name).to be false
    expect(xlsx.worksheets.first.drawings.first.picture.chart.display_labels.show_category_name).to be false
  end

  it 'ApiChart | SetTitle method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_chart/set_title.js')
    expect(xlsx.worksheets.first.drawings.first.picture.chart.title.elements.first.runs.first.text).to eq('Main Chart Title')
  end

  it 'ApiChart | SetVerAxisTitle method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_chart/set_ver_axis_title.js')
    expect(xlsx.worksheets.first.drawings.first.picture.chart.axises[1].title.elements.first.runs.first.text).to eq('Vertical Title')
    expect(xlsx.worksheets.first.drawings.first.picture.chart.axises[1].title.elements.first.runs.first.properties.font_size).to eq(10.0)
  end
end

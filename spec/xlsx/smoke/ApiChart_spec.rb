require 'spec_helper'
describe 'ApiChart section tests' do
  it 'ApiChart | SetHorAxisTitle method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiChart/sethoraxistitle.js')
    expect(xlsx.worksheets.first.drawings.first.picture.chart.axises.first.title.elements.first.runs.first.text).to eq('Horizontal Title')
  end

  it 'ApiChart | SetLegendPos method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiChart/setlegendpos.js')
    expect(xlsx.worksheets.first.drawings.first.picture.chart.display_labels.show_series_name).to be_falsey
    expect(xlsx.worksheets.first.drawings.first.picture.chart.display_labels.show_category_name).to be_falsey
  end

  it 'ApiChart | SetShowDataLabels method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiChart/setlegendpos.js')
    expect(xlsx.worksheets.first.drawings.first.picture.chart.display_labels.show_values).to be_truthy
  end

  it 'ApiChart | SetTitle method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiChart/settitle.js')
    expect(xlsx.worksheets.first.drawings.first.picture.chart.title.elements.first.runs.first.text).to eq('Main Chart Title')
  end

  it 'ApiChart | SetVerAxisTitle method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiChart/setveraxistitle.js')
    expect(xlsx.worksheets.first.drawings.first.picture.chart.axises[1].title.elements.first.runs.first.text).to eq('Vertical Title')
  end
end

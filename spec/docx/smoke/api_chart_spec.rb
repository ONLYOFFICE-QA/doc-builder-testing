require 'spec_helper'
describe 'ApiChart section tests' do
  it 'ApiChart | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiChart/getclasstype.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = chart')
  end

  it 'ApiChart | SetHorAxisTitle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiChart/sethoraxistitle.js')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.axises.first.title.elements.first.runs.first.text).to eq('Year')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.axises.first.title.elements.first.runs.first.properties.font_size).to eq(11.0)
  end

  it 'ApiChart | SetLegendPos method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiChart/setlegendpos.js')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.legend.position).to eq(:bottom)
  end

  it 'ApiChart | SetShowDataLabels method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiChart/setshowdatalabels.js')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.axises.first.title.elements.first.runs.first.text).to eq('Year')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.axises.first.title.elements.first.runs.first.properties.font_size).to eq(11)
  end

  it 'ApiChart | SetTitle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiChart/settitle.js')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.title.elements.first.runs.first.text).to eq('Financial Overview')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.title.elements.first.runs.first.properties.font_size).to eq(13.0)
  end

  it 'ApiChart | SetVerAxisTitle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiChart/setveraxistitle.js')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.axises[1].title.elements.first.runs.first.text).to eq('USD In Hundred Thousands')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.axises[1].title.elements.first.runs.first.properties.font_size).to eq(10)
  end
end

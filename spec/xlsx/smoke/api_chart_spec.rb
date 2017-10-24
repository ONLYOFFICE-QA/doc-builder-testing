require 'spec_helper'
describe 'ApiChart section tests' do
  it 'ApiChart | GetClassType method' do
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_chart/get_class_type.js')
    expect(xlsx.worksheets.first.rows.first.cells[6].text).to eq('chart')
    expect(xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first).to be_a(OoxmlParser::Chart)
  end

  it 'ApiChart | SetHorAxisTitle method' do
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_chart/set_hor_axis_title.js')
    expect(xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first.axises.first.title.elements.first.runs.first.text).to eq('Horizontal Title')
    expect(xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first.axises.first.title.elements.first.runs.first.properties.font_size).to eq(11.0)
  end

  it 'ApiChart | SetLegendPos method' do
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_chart/set_legend_pos.js')
    expect(xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first.legend.position).to eq(:right)
  end

  it 'ApiChart | SetShowDataLabels method' do
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_chart/set_show_data_labels.js')
    expect(xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first.display_labels.show_values).to be true
    expect(xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first.display_labels.show_series_name).to be false
    expect(xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first.display_labels.show_category_name).to be false
  end

  it 'ApiChart | SetTitle method' do
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_chart/set_title.js')
    expect(xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first.title.elements.first.runs.first.text).to eq('Main Chart Title')
  end

  it 'ApiChart | SetVerAxisOrientation method' do
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_chart/set_ver_axis_orientation.js')
    expect(xlsx.worksheets.first.drawings.first.graphic_frame
               .graphic_data.first.axises[1]
               .scaling.orientation.value).to eq(:max_min)
  end

  it 'ApiChart | SetVerAxisTitle method' do
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_chart/set_ver_axis_title.js')
    expect(xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first.axises[1].title.elements.first.runs.first.text).to eq('Vertical Title')
    expect(xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first.axises[1].title.elements.first.runs.first.properties.font_size).to eq(10.0)
  end

  it 'ApiChart | SetVertAxisTickLabelPosition method' do
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_chart/set_vert_axis_tick_label_position.js')
    expect(xlsx.worksheets.first.drawings.first.graphic_frame
               .graphic_data.first.axises[1]
               .tick_label_position.value).to eq(:high)
  end
end

require 'spec_helper'
describe 'ApiDrawing section tests' do
  it 'ApiDrawing | GetClassType method' do
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_drawing/get_class_type.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('shape')
  end

  it 'ApiDrawing | SetPosition method' do
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_drawing/set_position.js')
    expect(xlsx.worksheets.first.drawings.first.from.column).to eq('E')
    expect(xlsx.worksheets.first.drawings.first.from.column_offset).to eq(OoxmlParser::OoxmlSize.new(2 * 36_000, :emu))
    expect(xlsx.worksheets.first.drawings.first.from.row).to eq(3)
    expect(xlsx.worksheets.first.drawings.first.from.row_offset).to eq(OoxmlParser::OoxmlSize.new(3 * 36_000, :emu))
  end

  it 'ApiDrawing | SetSize method' do
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_drawing/set_size.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(120 * 36_000, :emu))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(70 * 36_000, :emu))
  end
end

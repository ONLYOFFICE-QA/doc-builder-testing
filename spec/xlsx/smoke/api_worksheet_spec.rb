require 'spec_helper'
describe 'ApiWorksheet section tests' do
  it 'ApiWorksheet | AddChart method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_worksheet/add_chart.js')
    xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first.series.each_with_index do |series, index|
      expect(series.text.string.formula).to eq("'sheet 1'!$A$#{index + 2}")
      expect(series.categories.string.formula).to eq("'sheet 1'!$B$1:$D$1")
    end
    expect(xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first.type).to eq(:column)
    expect(xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first.shape_properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(100 * 36_000, :emu))
    expect(xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first.shape_properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(70 * 36_000, :emu))
    expect(xlsx.worksheets.first.drawings.first.graphic_frame.graphic_data.first.alternate_content.office2007_content.style_number).to eq(2)
    expect(xlsx.worksheets.first.drawings.first.from.column).to eq('F')
    expect(xlsx.worksheets.first.drawings.first.from.column_offset).to eq(OoxmlParser::OoxmlSize.new(2 * 36_000, :emu))
    expect(xlsx.worksheets.first.drawings.first.from.row).to eq(2)
    expect(xlsx.worksheets.first.drawings.first.from.row_offset).to eq(OoxmlParser::OoxmlSize.new(3 * 36_000, :emu))
  end

  it 'ApiWorksheet | AddImage method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_worksheet/add_image.js')
    expect(xlsx.worksheets.first.drawings.first.picture.path_to_image.file_reference.content.length).to be >= 1_000
    expect(xlsx.worksheets.first.drawings.first.picture.shape_properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(60 * 36_000, :emu))
    expect(xlsx.worksheets.first.drawings.first.picture.shape_properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(35 * 36_000, :emu))
    expect(xlsx.worksheets.first.drawings.first.from.column).to eq('A')
    expect(xlsx.worksheets.first.drawings.first.from.column_offset).to eq(OoxmlParser::OoxmlSize.new(2 * 36_000, :emu))
    expect(xlsx.worksheets.first.drawings.first.from.row).to eq(1)
    expect(xlsx.worksheets.first.drawings.first.from.row_offset).to eq(OoxmlParser::OoxmlSize.new(3 * 36_000, :emu))
  end

  it 'ApiWorksheet | AddShape method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_worksheet/add_shape.js')
    expect(xlsx.worksheets.first.drawings.first.shape.properties.preset_geometry.name).to eq(:flowChartOnlineStorage)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(60 * 36_000, :emu))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(35 * 36_000, :emu))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.type).to eq(:gradient)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops.first.color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops.first.position).to eq(0)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 164, 101))
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.gradient_stops[1].position).to eq(100_000 / 1_000)
    expect(xlsx.worksheets.first.drawings.first.shape.properties.fill_color.value.linear_gradient.angle).to eq(5_400_000 / 100_000.0)
    expect(xlsx.worksheets.first.drawings.first.from.column).to eq('A')
    expect(xlsx.worksheets.first.drawings.first.from.column_offset).to eq(OoxmlParser::OoxmlSize.new(2 * 36_000, :emu))
    expect(xlsx.worksheets.first.drawings.first.from.row).to eq(1)
    expect(xlsx.worksheets.first.drawings.first.from.row_offset).to eq(OoxmlParser::OoxmlSize.new(3 * 36_000, :emu))
  end

  it 'ApiWorksheet | FormatAsTable method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_worksheet/format_as_table.js')
    xlsx.worksheets.first.table_parts.first.autofilter.ref.each do |current_autofilter|
      expect(current_autofilter.list).to eq 'Sheet1'
      expect(%w[A B C D E]).to include(current_autofilter.column)
      expect((1..10).to_a).to include(current_autofilter.row)
    end
  end

  it 'ApiWorksheet | GetRange method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_worksheet/get_range.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.alignment.horizontal).to eq(:center)
      end
    end
  end

  it 'ApiWorksheet | GetRangeByNumber method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_worksheet/get_range_by_number.js')
    expect(xlsx.worksheets.first.rows[1].cells[2].text).to eq('42')
  end

  it 'ApiWorksheet | SetColumnWidth method' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_worksheet/set_column_width.js')
    expect(xlsx.worksheets.first.columns.first.width.to_i).to eq(10)
    expect(xlsx.worksheets.first.columns[1].width.to_i).to eq(20)
  end

  it 'ApiWorksheet | SetName method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_worksheet/set_name.js')
    expect(xlsx.worksheets.first.name).to eq('sheet 1')
  end

  it 'ApiWorksheet | SetDisplayGridlines method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_worksheet/set_display_gridlines.js')
    expect(xlsx.worksheets.first.sheet_views.first.show_gridlines).to be_falsey
  end

  it 'ApiWorksheet | SetDisplayHeadings method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_worksheet/set_display_headings.js')
    expect(xlsx.worksheets.first.sheet_views.first.show_row_column_headers).to be_falsey
  end

  it 'ApiWorksheet | getter Name' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_worksheet/getter_name.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq(xlsx.worksheets.first.name)
  end

  it 'ApiWorksheet | setter Name' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_worksheet/setter_name.js')
    expect(xlsx.worksheets.first.name).to eq('sheet 1')
  end

  it 'ApiWorksheet | GetCells method' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_worksheet/get_cells.js')
    expect(xlsx.worksheets.first.columns.first.to).to eq(16384)
  end

  it 'ApiWorksheet | Getter Cells' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_worksheet/getter_cells.js')
    expect(xlsx.worksheets.first.columns.count).to eq(1)
    expect(xlsx.worksheets.first.columns.first.style.alignment.wrap_text).to be_truthy
  end

  it 'ApiWorksheet | AddSheet method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_worksheet/add_sheet.js')
    expect(xlsx.worksheets.count).to eq(2)
  end

  it 'ApiWorksheet | GetCols method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_worksheet/get_cols.js')
    expect(xlsx.worksheets.first.columns.first.style.fill_color.pattern_fill.background_color.rgb).to eq(OoxmlParser::Color.new(255, 224, 204))
  end

  it 'ApiWorksheet | GetRows method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_worksheet/get_rows.js')
    expect(xlsx.worksheets.first.rows.first.style.fill_color.pattern_fill.background_color.rgb).to eq(OoxmlParser::Color.new(255, 224, 204))
  end

  it 'ApiWorksheet | Cols getter' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_worksheet/cols_getter.js')
    expect(xlsx.worksheets.first.columns.first.style.font.font_style.bold).to be_truthy
  end

  it 'ApiWorksheet | Rows getter' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_worksheet/rows_getter.js')
    expect(xlsx.worksheets.first.columns.first.style.font.font_style.bold).to be_truthy
  end

  it 'ApiWorksheet | Index getter method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_worksheet/getter_index.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('0')
    expect(xlsx.worksheets.first.rows[1].cells.first.text).to eq('1')
  end

  it 'ApiWorksheet | Get Name method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_worksheet/get_name.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq(xlsx.worksheets.first.name)
  end

  it 'ApiRange | GetUsedRange method' do
    pending 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=37735'
    # skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_doc_and_parse('asserts/js/xlsx/smoke/api_worksheet/get_used_range.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('9')
  end
end

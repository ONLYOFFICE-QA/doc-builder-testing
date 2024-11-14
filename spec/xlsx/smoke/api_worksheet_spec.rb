# frozen_string_literal: true

require 'spec_helper'
describe 'ApiWorksheet section tests' do
  it 'ApiWorksheet | AddChart method', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/add_chart.js')
    drawing = xlsx.worksheets.first.drawings.first
    data = drawing.graphic_frame.graphic_data.first
    drawing.graphic_frame.graphic_data.first.series.each_with_index do |series, index|
      expect(series.text.string.formula).to eq("'sheet 1'!$A$#{index + 2}")
      expect(series.categories.string.formula).to eq("'sheet 1'!$B$1:$D$1")
    end
    expect(data.type).to eq(:column)
    expect(data.shape_properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(100 * 36_000, :emu))
    expect(data.shape_properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(70 * 36_000, :emu))
    expect(data.alternate_content.office2007_content.style_number).to eq(2)
    expect(drawing.from.column).to eq('F')
    expect(drawing.from.column_offset).to eq(OoxmlParser::OoxmlSize.new(2 * 36_000, :emu))
    expect(drawing.from.row).to eq(2)
    expect(drawing.from.row_offset).to eq(OoxmlParser::OoxmlSize.new(3 * 36_000, :emu))
  end

  it 'ApiWorksheet | AddImage method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/add_image.js')
    expect(xlsx.worksheets.first.drawings.first.picture.path_to_image.file_reference.content.length).to be >= 1_000
    expect(xlsx.worksheets.first.drawings.first.picture.shape_properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(60 * 36_000, :emu))
    expect(xlsx.worksheets.first.drawings.first.picture.shape_properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(35 * 36_000, :emu))
    expect(xlsx.worksheets.first.drawings.first.from.column).to eq('A')
    expect(xlsx.worksheets.first.drawings.first.from.column_offset).to eq(OoxmlParser::OoxmlSize.new(2 * 36_000, :emu))
    expect(xlsx.worksheets.first.drawings.first.from.row).to eq(1)
    expect(xlsx.worksheets.first.drawings.first.from.row_offset).to eq(OoxmlParser::OoxmlSize.new(3 * 36_000, :emu))
  end

  it 'ApiWorksheet | AddShape method', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/add_shape.js')
    drawing = xlsx.worksheets.first.drawings.first
    fill_color = drawing.shape.properties.fill_color.value
    expect(drawing.shape.properties.preset_geometry.name).to eq(:flowChartOnlineStorage)
    expect(drawing.shape.properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(60 * 36_000, :emu))
    expect(drawing.shape.properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(35 * 36_000, :emu))
    expect(drawing.shape.properties.fill_color.type).to eq(:gradient)
    expect(fill_color.gradient_stops.first.color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(fill_color.gradient_stops.first.position).to eq(0)
    expect(fill_color.gradient_stops[1].color).to eq(OoxmlParser::Color.new(255, 164, 101))
    expect(fill_color.gradient_stops[1].position).to eq(100_000 / 1_000)
    expect(fill_color.linear_gradient.angle).to eq(5_400_000 / 100_000.0)
    expect(drawing.from.column).to eq('A')
    expect(drawing.from.column_offset).to eq(OoxmlParser::OoxmlSize.new(2 * 36_000, :emu))
    expect(drawing.from.row).to eq(1)
    expect(drawing.from.row_offset).to eq(OoxmlParser::OoxmlSize.new(3 * 36_000, :emu))
  end

  it 'ApiWorksheet | AddProtectedRange method' do
    skip 'https://github.com/ONLYOFFICE-QA/ooxml_parser/issues/1403'
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/add_protected_range.js')
    expect(xlsx.worksheets.first.protected_ranges[0]).to be_a(Object)
  end

  it 'ApiWorksheet | FormatAsTable method', :critical do
    column_names = %w[A B C D E]
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/format_as_table.js')
    xlsx.worksheets.first.table_parts.first.autofilter.ref.each do |current_autofilter|
      expect(current_autofilter.list).to eq 'Sheet1'
      expect(current_autofilter.column).to(satisfy { |value| column_names.include?(value) })
      expect((1..10).to_a).to include(current_autofilter.row)
    end
  end

  it 'ApiWorksheet | GetRange method', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/get_range.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.alignment.horizontal).to eq(:center)
      end
    end
  end

  it 'ApiWorksheet | GetRangeByNumber method', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/get_range_by_number.js')
    expect(xlsx.worksheets.first.rows[1].cells[2].text).to eq('42')
  end

  it 'ApiWorksheet | SetColumnWidth method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/set_column_width.js')
    expect(xlsx.worksheets.first.columns.first.width.to_i).to eq(10)
    expect(xlsx.worksheets.first.columns[1].width.to_i).to eq(20)
  end

  it 'ApiWorksheet | SetName method', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/set_name.js')
    expect(xlsx.worksheets.first.name).to eq('sheet 1')
  end

  it 'ApiWorksheet | SetDisplayGridlines method', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/set_display_gridlines.js')
    expect(xlsx.worksheets.first.sheet_views.first.show_gridlines).to be_falsey
  end

  it 'ApiWorksheet | SetDisplayHeadings method', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/set_display_headings.js')
    expect(xlsx.worksheets.first.sheet_views.first.show_row_column_headers).to be_falsey
  end

  it 'ApiWorksheet | SetHyperlink method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/set_hyperlink.js')
    expect(xlsx.worksheets[1].hyperlinks[0].url.list).to eq('Sheet1')
    expect(xlsx.worksheets[1].hyperlinks[1].url.list).to eq('Sheet1')
    expect(xlsx.worksheets[1].hyperlinks[2].url).to eq('https://google.com')
  end

  it 'ApiWorksheet | getter Name' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/getter_name.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq(xlsx.worksheets.first.name)
  end

  it 'ApiWorksheet | setter Name' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/setter_name.js')
    expect(xlsx.worksheets.first.name).to eq('sheet 1')
  end

  it 'ApiWorksheet | GetCells method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/get_cells.js')
    expect(xlsx.worksheets.first.columns.first.to).to eq(16_384)
  end

  it 'ApiWorksheet | Getter Cells' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/getter_cells.js')
    expect(xlsx.worksheets.first.columns.count).to eq(1)
    expect(xlsx.worksheets.first.columns[0].style.fill_color).not_to be_nil
  end

  it 'ApiWorksheet | AddSheet method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/add_sheet.js')
    expect(xlsx.worksheets.count).to eq(2)
  end

  it 'ApiWorksheet | GetCols method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/get_cols.js')
    expect(xlsx.worksheets.first.columns.first.style.fill_color.pattern_fill.background_color.rgb).to eq(OoxmlParser::Color.new(255, 224, 204))
  end

  it 'ApiWorksheet | GetRows method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/get_rows.js')
    expect(xlsx.worksheets.first.rows.first.style.fill_color.pattern_fill.background_color.rgb).to eq(OoxmlParser::Color.new(255, 224, 204))
  end

  it 'ApiWorksheet | Cols getter' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/cols_getter.js')
    expect(xlsx.worksheets.first.columns.first.style.font.font_style.bold).to be_truthy
  end

  it 'ApiWorksheet | Rows getter' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/rows_getter.js')
    expect(xlsx.worksheets.first.columns.first.style.font.font_style.bold).to be_truthy
  end

  it 'ApiWorksheet | Index getter method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/getter_index.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('0')
    expect(xlsx.worksheets.first.rows[1].cells.first.text).to eq('1')
  end

  it 'ApiWorksheet | Get Name method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/get_name.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq(xlsx.worksheets.first.name)
  end

  it 'ApiWorksheet | GetUsedRange method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/get_used_range.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('9')
  end

  it 'ApiWorksheet | UsedRange getter' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/used_range_getter.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('9')
  end

  it 'ApiWorksheet | SetVisible method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/set_visible.js')
    expect(xlsx.sheets.first.state).to eq(:hidden)
  end

  it 'ApiWorksheet | GetVisible method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/get_visible.js')
    expect(xlsx.worksheets[1].rows.first.cells.first.text).to eq('0')
  end

  it 'ApiWorksheet | PrintHeadings property', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/print_headings_property.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('1')
  end

  it 'ApiWorksheet | GetPageOrientation method', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/get_page_orientation.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('xlPortrait')
  end

  it 'ApiWorksheet | Selection property' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/selection_property.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('1')
  end

  it 'ApiWorksheet | GetSelection method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/get_selection_method.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('1')
  end

  it 'ApiWorksheet | ActiveCell property' do
    pending('https://bugzilla.onlyoffice.com/show_bug.cgi?id=36752')
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/active_cell_property.js')
    expect(xlsx.worksheets.first.rows[12].cells[3].text).to eq('60')
  end

  it 'ApiWorksheet | PrintGridlines property', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/print_gridlines_property.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('0')
  end

  it 'ApiWorksheet | GetIndex property', :critical do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/get_index_property.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('1')
  end

  it 'ApiWorksheet | Delete sheet' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_worksheet/delete_worksheet.js')
    expect(xlsx.worksheets.count).to eq(1)
    expect(xlsx.worksheets.first.name).to eq('New sheet')
  end
end

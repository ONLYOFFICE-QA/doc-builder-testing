# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRange section tests' do
  it 'ApiRange | GetCol method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/get_col.js')
    expect(xlsx.worksheets.first.rows[1].cells.first.text).to eq('3')
  end

  it 'ApiRange | Col method' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/getter_col.js')
    expect(xlsx.worksheets.first.rows[1].cells.first.text).to eq('3')
  end

  it 'ApiRange | GetRow method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/get_row.js')
    expect(xlsx.worksheets.first.rows[1].cells.first.text).to eq('8')
  end

  it 'ApiRange | Row method' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/getter_row.js')
    expect(xlsx.worksheets.first.rows[1].cells.first.text).to eq('8')
  end

  it 'ApiRange | SetFontColor method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/set_font_color.js')
    expect(xlsx.worksheets.first.rows[1]
               .cells.first.style
               .font.color.rgb).to eq(OoxmlParser::Color.new(49, 133, 154))
    expect(xlsx.worksheets.first.rows[3]
               .cells.first.style
               .font.color.theme).to eq(1)
  end

  it 'ApiRange | FontColor method' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/setter_font_color.js')
    expect(xlsx.worksheets.first.rows[1]
               .cells.first.style
               .font.color.rgb).to eq(OoxmlParser::Color.new(49, 133, 154))
    expect(xlsx.worksheets.first.rows[3]
               .cells.first.style
               .font.color.theme).to eq(1)
  end

  it 'ApiRange | SetFontName method' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/setter_font_name.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.font.name).to eq('Arial')
      end
    end
  end

  it 'ApiRange | SetFontSize method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/set_font_size.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.font.size).to eq(20)
      end
    end
  end

  it 'ApiRange | FontSize method' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/setter_font_size.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.font.size).to eq(20)
      end
    end
  end

  it 'ApiRange | SetValue method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/set_value.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[1].cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[2].cells[0].text).to eq('2x2=')
    expect(xlsx.worksheets.first.rows[2].cells[1].text).to eq('4')
  end

  it 'ApiRange | Value method' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/setter_value.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[1].cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[2].cells[0].text).to eq('2x2=')
    expect(xlsx.worksheets.first.rows[2].cells[1].text).to eq('4')
  end

  it 'ApiRange | SetBold method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/set_bold.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('Bold text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.bold).to be_truthy
  end

  it 'ApiRange | Bold method' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/setter_bold.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('Bold text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.bold).to be_truthy
  end

  it 'ApiRange | SetItalic method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/set_italic.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('Italicized text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.italic).to be_truthy
  end

  it 'ApiRange | Italic method' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/setter_italic.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('Italicized text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.italic).to be_truthy
  end

  it 'ApiRange | SetUnderline method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/set_underline.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('The text underlined with a single line')
    expect(xlsx.worksheets.first.rows[3].cells[0].raw_text).to eq('Normal text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.underlined).to eq(:single)
    expect(xlsx.worksheets.first.rows[3].cells[0].style.font.font_style.underlined).to eq(:none)
  end

  it 'ApiRange | Underline method' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/setter_underline.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('The text underlined with a single line')
    expect(xlsx.worksheets.first.rows[3].cells[0].raw_text).to eq('Normal text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.underlined).to eq(:single)
    expect(xlsx.worksheets.first.rows[3].cells[0].style.font.font_style.underlined).to eq(:none)
  end

  it 'ApiRange | SetStrikeout method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/set_strikeout.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('Struckout text')
    expect(xlsx.worksheets.first.rows[2].cells[0].raw_text).to eq('Normal text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.strike).to eq(:single)
    expect(xlsx.worksheets.first.rows[2].cells[0].style.font.font_style.strike).to eq(:none)
  end

  it 'ApiRange | SetFillColor method' do
    skip('Not working on develop because need newest core')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/set_fill_color.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.fill_color.pattern_fill.background_color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.rows[1].cells[0].style.fill_color.pattern_fill.foreground_color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('This is the cell with a color set to its background')
    expect(xlsx.worksheets.first.rows[3].cells[0].style.fill_color).to be_nil
    expect(xlsx.worksheets.first.rows[3].cells[0].raw_text).to eq('This is the cell with a default background color')
  end

  it 'ApiRange | FillColor method' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/setter_fill_color.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.fill_color.pattern_fill.background_color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.rows[1].cells[0].style.fill_color.pattern_fill.foreground_color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('This is the cell with a color set to its background')
    expect(xlsx.worksheets.first.rows[3].cells[0].style.fill_color).to be_nil
    expect(xlsx.worksheets.first.rows[3].cells[0].raw_text).to eq('This is the cell with a default background color')
  end

  it 'ApiRange | SetNumberFormat method' do
    formats = ['General', '0.00', '$#,##0.00', '_($* #,##0.00_)',
               'm/d/yyyy', '[$-F800]dddd, mmmm dd, yyyy',
               '[$-F400]h:mm:ss AM/PM', '0.00%', '0%', '# ?/?', '0.00E+00']
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/set_number_format.js')
    formats.each_with_index do |current_format, i|
      expect(xlsx.worksheets.first.rows[i + 1].cells[0].raw_text).to eq('123456')
      expect(xlsx.worksheets.first.rows[i + 1].cells[0].style.numerical_format).to eq(current_format)
    end
    expect(xlsx.worksheets.first.rows.last.cells[0].style.apply_number_format).to be_truthy
  end

  it 'ApiRange | NumberFormat method' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    formats = ['General', '0.00', '$#,##0.00', '_($* #,##0.00_)', 'm/d/yyyy',
               '[$-F800]dddd, mmmm dd, yyyy', '[$-F400]h:mm:ss AM/PM',
               '0.00%', '0%', '# ?/?', '0.00E+00']
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/setter_number_format.js')
    formats.each_with_index do |current_format, i|
      expect(xlsx.worksheets.first.rows[i + 1].cells[0].raw_text).to eq('123456')
      expect(xlsx.worksheets.first.rows[i + 1].cells[0].style.numerical_format).to eq(current_format)
    end
    expect(xlsx.worksheets.first.rows.last.cells[0].style.apply_number_format).to be_truthy
  end

  it 'ApiRange | Merge method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/merge.js')
    expect(xlsx.worksheets.first.merge).to eq(['A3:E3', 'A4:E4', 'A5:E5', 'A6:E6', 'A7:E7', 'A8:E8', 'A9:E14'])
  end

  it 'ApiRange | Unmerge method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/un_merge.js')
    expect(xlsx.worksheets.first.merge).to eq(['A3:E3', 'A4:E4', 'A6:E6', 'A7:E7', 'A8:E8'])
  end

  it 'ApiRange | SetBorders method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/set_borders.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.bottom.color).to eq(OoxmlParser::Color.new(49, 133, 154))
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.bottom.style).to eq(:thick)
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.left.color).to eq(nil)
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.right.color).to eq(nil)
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.top.color).to eq(nil)
  end

  it 'ApiRange | GetValue method' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/get_value.js')
    expect(xlsx.worksheets.first.rows[2].cells[0].text).to eq('Inserted text')
  end

  it 'ApiRange | Value Getter' do
    skip if builder.semver < Semantic::Version.new('5.1.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/getter_value.js')
    expect(xlsx.worksheets.first.rows[2].cells[0].text).to eq('Inserted text')
  end

  it 'ApiRange | SetColumnWidth method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/set_column_width.js')
    expect(xlsx.worksheets.first.columns.first.width.to_i).to eq(15)
  end

  it 'ApiRange | SetRowHeight method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/set_row_height.js')
    expect(xlsx.worksheets.first.rows.first.height).to eq(OoxmlParser::OoxmlSize.new(15, :point))
  end

  it 'ApiRange | GetRowHeight method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/get_row_height.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('15')
  end

  it 'ApiRange | GetColumnWidth method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/get_column_width.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('15')
  end

  it 'ApiRange | ColumnWidth getter' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/column_width_getter.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('15')
  end

  it 'ApiRange | RowHeight getter' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/row_height_getter.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('30')
  end

  it 'ApiRange | ForEach' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/for_each.js')
    expect(xlsx.worksheets.first.rows[0].cells[0].style.fill_color.pattern_fill.background_color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.rows[1].cells[0].style.fill_color.pattern_fill.background_color).to eq(OoxmlParser::Color.new(255, 224, 204))
  end

  it 'ApiRange | Width getter' do
    pending('https://bugzilla.onlyoffice.com/show_bug.cgi?id=37730')
    # skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/width_getter.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('15')
  end

  it 'ApiRange | Height getter' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/height_getter.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('30')
  end

  it 'ApiRange | SetHidden method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/set_hidden.js')
    expect(xlsx.worksheets.first.columns.first.hidden).to be_truthy
  end

  it 'ApiRange | GetHidden method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/hidden_getter.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('1')
  end

  it 'ApiRange | Hidden getter' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/get_hidden.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('1')
  end

  it 'ApiRange | GetCount method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/get_count.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('9')
  end

  it 'ApiRange | Count getter' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/count_getter.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('9')
  end

  it 'ApiRange | MergeArea property' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/merge_area_property.js')
    expect(xlsx.worksheets.first.rows[3].cells.first.text).to eq('9')
  end

  it 'ApiRange | GetWrapText method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/get_wrap_text.js')
    expect(xlsx.worksheets.first.rows[2].cells.first.text).to eq('1')
    expect(xlsx.worksheets.first.rows[3].cells.first.text).to eq('0')
  end

  it 'ApiRange | SetOffset method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/set_offset.js')
    expect(xlsx.worksheets.first.rows[3].cells[1].text).to eq('Text')
  end

  it 'ApiRange | GetAddress method' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/get_address.js')
    expect(xlsx.worksheets.first.rows[0].cells[0].text).to eq('A1')
  end
end

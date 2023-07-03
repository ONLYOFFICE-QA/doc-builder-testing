# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRange section tests' do
  before do
    include TestData
  end

  it 'ApiRange | GetCol method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/get_col.js')
    expect(xlsx.worksheets.first.rows[1].cells.first.text).to eq('4')
  end

  it 'ApiRange | Col method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/getter_col.js')
    expect(xlsx.worksheets.first.rows[1].cells.first.text).to eq('4')
  end

  it 'ApiRange | GetRow method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/get_row.js')
    expect(xlsx.worksheets.first.rows[1].cells.first.text).to eq('9')
  end

  it 'ApiRange | Row method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/getter_row.js')
    expect(xlsx.worksheets.first.rows[1].cells.first.text).to eq('9')
  end

  it 'ApiRange | SetFontName method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/setter_font_name.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.font.name).to eq('Arial')
      end
    end
  end

  it 'ApiRange | SetFontSize method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_font_size.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.font.size).to eq(20)
      end
    end
  end

  it 'ApiRange | FontSize method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/setter_font_size.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.font.size).to eq(20)
      end
    end
  end

  it 'ApiRange | SetValue method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_value.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[1].cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[2].cells[0].text).to eq('2x2=')
    expect(xlsx.worksheets.first.rows[2].cells[1].text).to eq('4')
  end

  it 'ApiRange | Value method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/setter_value.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[1].cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[2].cells[0].text).to eq('2x2=')
    expect(xlsx.worksheets.first.rows[2].cells[1].text).to eq('4')
  end

  it 'ApiRange | SetNumberFormat method' do
    formats = ['General', '0.00', '$#,##0.00', '_($* #,##0.00_)',
               'm/d/yyyy', '[$-F800]dddd, mmmm dd, yyyy',
               '[$-F400]h:mm:ss AM/PM', '0.00%', '0%', '# ?/?', '0.00E+00']
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_number_format.js')
    formats.each_with_index do |current_format, i|
      expect(xlsx.worksheets.first.rows[i + 1].cells[0].raw_text).to eq('123456')
      expect(xlsx.worksheets.first.rows[i + 1].cells[0].style.numerical_format).to eq(current_format)
    end
    expect(xlsx.worksheets.first.rows.last.cells[0].style.apply_number_format).to be_truthy
  end

  it 'ApiRange | NumberFormat method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/setter_number_format.js')
    TestData.number_formats.each_with_index do |format, i|
      expect(xlsx.worksheets.first.rows[i + 1].cells[0].raw_text).to eq('123456')
      expect(xlsx.worksheets.first.rows[i + 1].cells[0].style.numerical_format).to eq(format)
    end
    expect(xlsx.worksheets.first.rows.last.cells[0].style.apply_number_format).to be_truthy
  end

  it 'ApiRange | GetNumberFormat' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/get_number_format.js')
    TestData.number_formats.each_with_index do |format, i|
      expect(xlsx.worksheets.first.rows[i + 1].cells[2].raw_text).to eq('123456')
      expect(xlsx.worksheets.first.rows[i + 1].cells[2].style.numerical_format).to eq(format)
    end
    expect(xlsx.worksheets.first.rows.last.cells[2].style.apply_number_format).to be_truthy
  end

  it 'ApiRange | SetBorders method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_borders.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.bottom.color).to eq(OoxmlParser::Color.new(49, 133, 154))
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.bottom.style).to eq(:thick)
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.left.color).to be_nil
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.right.color).to be_nil
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.top.color).to be_nil
  end

  it 'ApiRange | GetValue method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/get_value.js')
    expect(xlsx.worksheets.first.rows[2].cells[0].text).to eq('Inserted text')
  end

  it 'ApiRange | Value Getter' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/getter_value.js')
    expect(xlsx.worksheets.first.rows[2].cells[0].text).to eq('Inserted text')
  end

  it 'ApiRange | ForEach' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/for_each.js')
    expect(xlsx.worksheets.first.rows[0].cells[0].style.fill_color.pattern_fill.background_color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.rows[1].cells[0].style.fill_color.pattern_fill.background_color).to eq(OoxmlParser::Color.new(255, 224, 204))
  end

  it 'ApiRange | Width getter' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/width_getter.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('110')
  end

  it 'ApiRange | Height getter' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/height_getter.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('30')
  end

  it 'ApiRange | SetHidden method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_hidden.js')
    expect(xlsx.worksheets.first.columns.first.hidden).to be_truthy
  end

  it 'ApiRange | GetHidden method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/hidden_getter.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('1')
  end

  it 'ApiRange | Hidden getter' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/get_hidden.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('1')
  end

  it 'ApiRange | GetCount method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/get_count.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('9')
  end

  it 'ApiRange | Count getter' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/count_getter.js')
    expect(xlsx.worksheets.first.rows.first.cells.first.text).to eq('9')
  end

  it 'ApiRange | GetWrapText method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/get_wrap_text.js')
    expect(xlsx.worksheets.first.rows[2].cells.first.text).to eq('1')
    expect(xlsx.worksheets.first.rows[3].cells.first.text).to eq('0')
  end

  it 'ApiRange | SetOffset method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_offset.js')
    expect(xlsx.worksheets.first.rows[3].cells[1].text).to eq('Text')
  end

  it 'ApiRange | GetAddress method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/get_address.js')
    expect(xlsx.worksheets.first.rows[0].cells[0].text).to eq('A1')
  end
end

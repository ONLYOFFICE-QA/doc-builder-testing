require 'spec_helper'
describe 'ApiRange section tests' do
  it 'ApiRange | GetCol method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/get_col.js')
    expect(xlsx.worksheets.first.rows[1].cells.first.text).to eq('3')
  end

  it 'ApiRange | GetRow method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/get_row.js')
    expect(xlsx.worksheets.first.rows[1].cells.first.text).to eq('8')
  end

  it 'ApiRange | SetAlignHorizontal method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/set_align_horizontal.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.alignment.horizontal).to eq(:center)
      end
    end
  end

  it 'ApiRange | SetAlignVertical method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/set_align_vertical.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.alignment.vertical).to eq(:top)
      end
    end
  end

  xit 'ApiRange | SetFontColor method' do
    pending('Interface for font color is changed is sdk-all 4.3.0')
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/set_font_color.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.font.color).to eq(OoxmlParser::Color.new(0, 255, 0))
      end
    end
  end

  it 'ApiRange | SetFontName method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/set_font_name.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.font.name).to eq('Arial')
      end
    end
  end

  it 'ApiRange | SetFontSize method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/set_font_size.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.font.size).to eq(20)
      end
    end
  end

  it 'ApiRange | SetValue method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/set_value.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[1].cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[2].cells[0].text).to eq('2x2=')
    expect(xlsx.worksheets.first.rows[2].cells[1].text).to eq('4')
  end

  it 'ApiRange | SetBold method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/set_bold.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('Bold text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.bold).to be_truthy
  end

  it 'ApiRange | SetItalic method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/set_italic.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('Italicized text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.italic).to be_truthy
  end

  it 'ApiRange | SetUnderline method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/set_underline.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('The text underlined with a single line')
    expect(xlsx.worksheets.first.rows[3].cells[0].raw_text).to eq('Normal text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.underlined).to eq(:single)
    expect(xlsx.worksheets.first.rows[3].cells[0].style.font.font_style.underlined).to eq(:none)
  end

  it 'ApiRange | SetStrikeout method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/set_strikeout.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('Struckout text')
    expect(xlsx.worksheets.first.rows[2].cells[0].raw_text).to eq('Normal text')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.font.font_style.strike).to eq(:single)
    expect(xlsx.worksheets.first.rows[2].cells[0].style.font.font_style.strike).to eq(:none)
  end

  it 'ApiRange | SetFillColor method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/set_fill_color.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.fill_color.color).to eq(OoxmlParser::Color.new(255, 224, 204))
    expect(xlsx.worksheets.first.rows[1].cells[0].raw_text).to eq('This is the cell with a color set to its background')
    expect(xlsx.worksheets.first.rows[3].cells[0].style.fill_color.color).to eq(OoxmlParser::Color.new)
    expect(xlsx.worksheets.first.rows[3].cells[0].raw_text).to eq('This is the cell with a default background color')
  end

  it 'ApiRange | SetNumberFormat method' do
    pending 'https://github.com/ONLYOFFICE/ooxml_parser/issues/317'
    formats = ['General', '0.00', '$#,##0.00', '_($* #,##0.00_)', 'm/d/yyyy', '[$-F800]dddd, mmmm dd, yyyy', '[$-F400]h:mm:ss AM/PM', '0.00%', '0.00%', '# ?/?', '0.00E+00', 'Text']
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/set_number_format.js')
    formats.each_with_index do |current_format, i|
      expect(xlsx.worksheets.first.rows[i + 1].cells[0].raw_text).to eq('123456')
      expect(xlsx.worksheets.first.rows[i + 1].cells[0].style.numerical_format).to eq(current_format)
    end
  end

  it 'ApiRange | Merge method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/merge.js')
    expect(xlsx.worksheets.first.merge).to eq(['A3:E3', 'A4:E4', 'A5:E5', 'A6:E6', 'A7:E7', 'A8:E8', 'A9:E14'])
  end

  it 'ApiRange | Unmerge method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/unmerge.js')
    expect(xlsx.worksheets.first.merge).to eq(['A3:E3', 'A4:E4', 'A6:E6', 'A7:E7', 'A8:E8'])
  end

  it 'ApiRange | SetBorders method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/setborders.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.bottom.color).to eq(OoxmlParser::Color.new(49, 133, 154))
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.bottom.style).to eq(:thick)
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.left.color).to eq(nil)
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.right.color).to eq(nil)
    expect(xlsx.worksheets.first.rows[1].cells[0].style.borders.top.color).to eq(nil)
  end

  it 'ApiRange | SetWrap method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_range/set_wrap.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.alignment.wrap_text).to be_truthy
    expect(xlsx.worksheets.first.rows[1].cells[2].style.alignment.wrap_text).to be_falsey
  end
end

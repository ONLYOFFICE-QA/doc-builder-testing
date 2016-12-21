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
end

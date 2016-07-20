require 'spec_helper'
describe 'ApiRange section tests' do
  it 'ApiRange | SetAlignHorizontal method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiRange/setalignhorizontal.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.alignment.horizontal).to eq(:center)
      end
    end
  end

  it 'ApiRange | SetAlignVertical method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiRange/setalignvertical.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.alignment.vertical).to eq(:top)
      end
    end
  end

  it 'ApiRange | SetFontColor method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiRange/setfontcolor.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.font.color).to eq(OoxmlParser::Color.new(0, 255, 0))
      end
    end
  end

  it 'ApiRange | SetFontName' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiRange/setfontname.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.font.name).to eq('Arial')
      end
    end
  end

  it 'ApiRange | SetFontSize' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiRange/setfontsize.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.font.size).to eq(20)
      end
    end
  end

  it 'ApiRange | SetValue' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiRange/setvalue.js')
    expect(xlsx.worksheets.first.rows.first.cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[1].cells[1].text).to eq('2')
    expect(xlsx.worksheets.first.rows[2].cells[0].text).to eq('2x2=')
    expect(xlsx.worksheets.first.rows[2].cells[1].text).to eq('4')
  end
end

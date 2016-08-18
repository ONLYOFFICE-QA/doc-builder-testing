require 'spec_helper'
describe 'ApiWorksheet section tests' do
  it 'ApiWorksheet | AddChart method' do
    pending('interface documentbuilder for charted changed, need to fix it') # TODO: fix it
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiWorksheet/addchart.js')
    expect(xlsx.worksheets.first.drawings.first.picture.chart.series.first.text.string.formula).to eq("'sheet 1'!$A$2")
    expect(xlsx.worksheets.first.drawings.first.picture.chart.series.first.text.string.formula).to eq("'sheet 1'!$A$2")
    expect(xlsx.worksheets.first.drawings.first.picture.chart.series.last.text.string.formula).to eq("'sheet 1'!$A$5")
    expect(xlsx.worksheets.first.drawings.first.picture.chart.series.last.categories.string.formula).to eq("'sheet 1'!$B$1:$D$1")
    expect(xlsx.worksheets.first.drawings.first.picture.chart.type).to eq(:column)
    expect(xlsx.worksheets.first.drawings.first.picture.chart.type).to eq(:column)
  end

  it 'ApiWorksheet | FormatAsTable method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiWorksheet/formatastable.js')
    xlsx.worksheets.first.table_parts.first.autofilter.each do |current_autofilter|
      expect(current_autofilter.list).to eq 'Sheet1'
      expect(%w(A B C D E)).to include(current_autofilter.column)
      expect((1..10).to_a).to include(current_autofilter.row)
    end
  end

  it 'ApiWorksheet | GetRange method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiWorksheet/getrange.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.alignment.horizontal).to eq(:center)
      end
    end
  end

  it 'ApiWorksheet | SetColumnWidth method' do
    pending 'SE Editor give uncorrect data. Sasha Tr. will fix it'
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiWorksheet/setcolumnwidth.js')
    expect(xlsx.worksheets.first.columns.first.width).to eq(10)
    expect(xlsx.worksheets.first.columns[1].width).to eq(10)
    expect(xlsx.nil?).to eq(false)
  end

  it 'ApiWorksheet | SetName method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/ApiWorksheet/setname.js')
    expect(xlsx.worksheets.first.name).to eq('sheet 1')
  end
end

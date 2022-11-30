# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRange section tests' do
  it 'ApiRange | SetAlignHorizontal method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_align_horizontal.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.alignment.horizontal).to eq(:center)
      end
    end
  end

  it 'ApiRange | AlignHorizontal method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/setter_align_horizontal.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.alignment.horizontal).to eq(:center)
      end
    end
  end

  it 'ApiRange | SetAlignVertical method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_align_vertical.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.alignment.vertical).to eq(:top)
      end
    end
  end

  it 'ApiRange | AlignVertical method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/setter_align_vertical.js')
    xlsx.worksheets.first.rows.each do |current_row|
      current_row.cells.each do |current_cell|
        expect(current_cell.style.alignment.vertical).to eq(:top)
      end
    end
  end

  it 'ApiRange | SetWrap method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_wrap.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.alignment.wrap_text).to be_truthy
    expect(xlsx.worksheets.first.rows[1].cells[2].style.alignment.wrap_text).to be_falsey
  end

  it 'ApiRange | SetWrapText method' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/set_wrap_text.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.alignment.wrap_text).to be_truthy
    expect(xlsx.worksheets.first.rows[1].cells[2].style.alignment.wrap_text).to be_falsey
  end

  it 'ApiRange | Wrap property' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/wrap_property.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.alignment.wrap_text).to be_truthy
    expect(xlsx.worksheets.first.rows[1].cells[2].style.alignment.wrap_text).to be_falsey
  end

  it 'ApiRange | WrapText property' do
    xlsx = builder.build_and_parse('js/xlsx/smoke/api_range/wrap_text_property.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].style.alignment.wrap_text).to be_truthy
    expect(xlsx.worksheets.first.rows[1].cells[2].style.alignment.wrap_text).to be_falsey
  end
end

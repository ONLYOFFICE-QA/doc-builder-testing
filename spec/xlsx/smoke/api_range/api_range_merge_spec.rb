# frozen_string_literal: true

require 'spec_helper'

describe 'ApiRange Merge' do
  it 'ApiRange | Merge method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/merge.js')
    expect(xlsx.worksheets.first.merge).to eq(['A3:E3', 'A4:E4', 'A5:E5', 'A6:E6', 'A7:E7', 'A8:E8', 'A9:E14'])
  end

  it 'ApiRange | Unmerge method' do
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/un_merge.js')
    expect(xlsx.worksheets.first.merge).to eq(['A3:E3', 'A4:E4', 'A6:E6', 'A7:E7', 'A8:E8'])
  end

  it 'ApiRange | MergeArea property' do
    skip if builder.semver < Semantic::Version.new('5.2.0')
    xlsx = builder.build_and_parse('asserts/js/xlsx/smoke/api_range/merge_area_property.js')
    expect(xlsx.worksheets.first.rows[3].cells.first.text).to eq('9')
  end
end

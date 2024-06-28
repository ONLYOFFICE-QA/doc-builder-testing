# frozen_string_literal: true

require 'spec_helper'
describe 'ApiTable AddCaption' do
  before(:all) do
    @docx = builder.build_and_parse('js/docx/smoke/api_table/add_caption.js')
  end

  def check_caption(element, text_arr)
    element.nonempty_runs.each_with_index do |item, index|
      expect(item.text).to eq(text_arr[index])
      expect(item.font_color.to_s).to eq('RGB (14, 40, 65)')
      expect(item.size).to eq(9.0)
      expect(item.position).to eq(0.0)
    end
  end

  it 'Check document structure' do
    expect(@docx.elements.size).to eq(19)
  end

  it 'Check AddCaption without parameters' do
    expect(@docx.elements[4].class).to eq(OoxmlParser::Table)

    caption = @docx.elements[5]
    expect(caption.nonempty_runs.size).to eq(2)
    check_caption(caption, ['Table ', '1'])
  end

  it 'Check AddCaption with additional text' do
    expect(@docx.elements[7].class).to eq(OoxmlParser::Table)

    caption = @docx.elements[8]
    expect(caption.nonempty_runs.size).to eq(4)
    check_caption(caption, ['Figure ', '.', '1', ' caption text '])
  end

  it 'Check AddCaption with bExludeLabel: true and nHeadingLvl: 1' do
    expect(@docx.elements[10].class).to eq(OoxmlParser::Table)

    caption = @docx.elements[11]
    expect(caption.nonempty_runs.size).to eq(4)
    check_caption(caption, ['1', ':', '2', ' caption text '])
  end

  it 'Check AddCaption with bBefore: true and nHeadingLvl: 2' do
    expect(@docx.elements[14].class).to eq(OoxmlParser::Table)

    caption = @docx.elements[13]
    expect(caption.nonempty_runs.size).to eq(4)
    check_caption(caption, ['Equation ', '1.1', '-', '1'])
  end

  it 'Check AddCaption with nHeadingLvl: 3' do
    expect(@docx.elements[16].class).to eq(OoxmlParser::Table)

    caption = @docx.elements[17]
    expect(caption.nonempty_runs.size).to eq(4)
    check_caption(caption, ['Table ', '1.1.1', '—', '3'])
  end
end

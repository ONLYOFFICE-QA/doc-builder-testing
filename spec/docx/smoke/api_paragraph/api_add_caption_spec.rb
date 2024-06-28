# frozen_string_literal: true

require 'spec_helper'
describe 'ApiParagraph AddCaption' do
  before(:all) do
    @docx = builder.build_and_parse('js/docx/smoke/api_paragraph/add_caption.js')
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
    expect(@docx.elements.size).to eq(13)
  end

  it 'Check AddCaption without parameters' do
    paragraph = @docx.elements[0].nonempty_runs.first
    expect(paragraph.text).to eq('Caption without parameters')

    caption = @docx.elements[1]
    expect(caption.nonempty_runs.size).to eq(2)
    check_caption(caption, ['Table ', '1'])
  end

  it 'Check AddCaption with additional text' do
    paragraph = @docx.elements[5].nonempty_runs.first
    expect(paragraph.text).to eq('Caption with additional text')

    caption = @docx.elements[6]
    expect(caption.nonempty_runs.size).to eq(4)
    check_caption(caption, ['Figure ', '.', '1', ' caption text '])
  end

  it 'Check AddCaption with bExludeLabel: true' do
    paragraph = @docx.elements[7].nonempty_runs.first
    expect(paragraph.text).to eq('Caption with bExludeLabel: true and nHeadingLvl: 1')

    caption = @docx.elements[8]
    expect(caption.nonempty_runs.size).to eq(4)
    check_caption(caption, ['1', ':', '1', ' caption text '])
  end

  it 'Check AddCaption with bBefore: true' do
    paragraph = @docx.elements[10].nonempty_runs.first
    expect(paragraph.text).to eq('Caption with bBefore: true and nHeadingLvl: 2')

    caption = @docx.elements[9]
    expect(caption.nonempty_runs.size).to eq(4)
    check_caption(caption, ['Equation ', '1.1', '-', '1'])
  end

  it 'Check AddCaption with nHeadingLvl: 3' do
    paragraph = @docx.elements[11].nonempty_runs.first
    expect(paragraph.text).to eq('Caption with nHeadingLvl: 3')

    caption = @docx.elements[12]
    expect(caption.nonempty_runs.size).to eq(4)
    check_caption(caption, ['Table ', '1.1.1', '—', '2'])
  end
end

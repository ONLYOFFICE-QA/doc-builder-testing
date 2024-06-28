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
    expect(@docx.elements.size).to eq(8)
  end

  it 'Check AddCaption without parameters' do
    paragraph = @docx.elements[0].nonempty_runs.first
    expect(paragraph.text).to eq('Caption without parameters')

    caption = @docx.elements[1]
    expect(caption.nonempty_runs.size).to eq(2)
    check_caption(caption, ['Table ', '1'])
  end

  it 'Check AddCaption with additional text' do
    paragraph = @docx.elements[2].nonempty_runs.first
    expect(paragraph.text).to eq('Caption with additional text')

    caption = @docx.elements[3]
    expect(caption.nonempty_runs.size).to eq(4)
    check_caption(caption, ['Figure ', '-', '1', ' caption text '])
  end

  it 'Check AddCaption with bExludeLabel: true' do
    paragraph = @docx.elements[4].nonempty_runs.first
    expect(paragraph.text).to eq('Caption with bExludeLabel: true')

    caption = @docx.elements[5]
    expect(caption.nonempty_runs.size).to eq(3)
    check_caption(caption, [':', '1', ' caption text '])
  end

  it 'Check AddCaption with bBefore: true' do
    paragraph = @docx.elements[7].nonempty_runs.first
    expect(paragraph.text).to eq('Caption with bBefore: true')

    caption = @docx.elements[6]
    expect(caption.nonempty_runs.size).to eq(3)
    check_caption(caption, ['Equation ', '.', '2'])
  end
end

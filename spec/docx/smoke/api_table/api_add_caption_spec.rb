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
    expect(@docx.elements.size).to eq(13)
  end

  it 'Check AddCaption without parameters' do
    expect(@docx.elements[1].class).to eq(OoxmlParser::Table)

    caption = @docx.elements[2]
    expect(caption.nonempty_runs.size).to eq(2)
    check_caption(caption, ['Table ', '1'])
  end

  it 'Check AddCaption with additional text' do
    expect(@docx.elements[4].class).to eq(OoxmlParser::Table)

    caption = @docx.elements[5]
    expect(caption.nonempty_runs.size).to eq(4)
    check_caption(caption, ['Table ', '-', '2', ' caption text '])
  end

  it 'Check AddCaption with bExludeLabel: true' do
    expect(@docx.elements[7].class).to eq(OoxmlParser::Table)

    caption = @docx.elements[8]
    expect(caption.nonempty_runs.size).to eq(3)
    check_caption(caption, [':', '1', ' caption text '])
  end

  it 'Check AddCaption with bBefore: true' do
    expect(@docx.elements[11].class).to eq(OoxmlParser::Table)

    caption = @docx.elements[10]
    expect(caption.nonempty_runs.size).to eq(3)
    check_caption(caption, ['Equation ', '.', '1'])
  end
end

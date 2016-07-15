require 'spec_helper'

describe 'text with tabs' do
  it 'Tabs' do
    pending('Graphics not implemented yet by Luzyanin')
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/text/add_default_image.js')
    expect(File.size?(docx.elements[1].character_style_array.first.drawing.graphic.data.path_to_image.path_to_media_file)).to be >= 1_000
  end
end

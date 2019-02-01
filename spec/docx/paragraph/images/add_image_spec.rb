require 'spec_helper'
describe 'Add image to paragraph' do
  it 'Add default image' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/images/create_image_base64.js')
    drawing = docx.elements.first.nonempty_runs.first.drawing
    drawing ||= docx.elements.first.nonempty_runs.first.alternate_content.office2010_content
    expect(drawing.graphic.type).to eq(:picture)
    expect(drawing.graphic.data.path_to_image.file_reference.content.length).to be > 1000
    expect(drawing.properties.object_size.x).to eq(OoxmlParser::OoxmlSize.new(2_160_000, :emu))
    expect(drawing.properties.object_size.y).to eq(OoxmlParser::OoxmlSize.new(1_260_000, :emu))
  end
end

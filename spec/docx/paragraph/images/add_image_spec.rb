require 'spec_helper'
describe 'Add image to paragraph' do
  it 'Add default image' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/images/create_image_base64.js')
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.type).to eq(:picture)
    expect(docx.elements.first.nonempty_runs.first.drawings.first.graphic.data.path_to_image.file_reference.content.length).to be > 1000
    expect(docx.elements.first.nonempty_runs.first.drawings.first.properties.object_size.x).to eq(OoxmlParser::OoxmlSize.new(2_160_000, :emu))
    expect(docx.elements.first.nonempty_runs.first.drawings.first.properties.object_size.y).to eq(OoxmlParser::OoxmlSize.new(1_260_000, :emu))
  end
end

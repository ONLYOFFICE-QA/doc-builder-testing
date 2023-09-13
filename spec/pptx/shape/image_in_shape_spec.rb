# frozen_string_literal: true

require 'spec_helper'
describe 'Image in shape', :critical do
  it 'ApiChart | GetClassType method' do
    pptx = builder.build_and_parse('js/pptx/shape/create_image_base64.js')
    expect(pptx.slides.first.elements.first.path_to_image.file_reference.content.length).to be >= 1_000
    expect(pptx.slides.first.elements.first.properties.shape_size.extent.x).to eq(OoxmlParser::OoxmlSize.new(300 * 36_000, :emu))
    expect(pptx.slides.first.elements.first.properties.shape_size.extent.y).to eq(OoxmlParser::OoxmlSize.new(150 * 36_000, :emu))
  end
end

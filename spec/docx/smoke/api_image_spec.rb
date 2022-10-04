# frozen_string_literal: true

require 'spec_helper'
describe 'ApiImage section tests' do
  it 'ApiImage | GetClassType method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_image/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = image')
  end

  it 'ApiImage | GetWeight/GetHeight methods' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_image/get_size_image.js')
    expect(docx.elements[0].nonempty_runs.first.text).to eq(OoxmlParser::OoxmlSize.new(2_188_800, :emu).value.to_s)
    expect(docx.elements[1].nonempty_runs.first.text).to eq(OoxmlParser::OoxmlSize.new(1_386_000, :emu).value.to_s)
  end
end

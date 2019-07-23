# frozen_string_literal: true

require 'spec_helper'
describe 'ApiImage section tests' do
  it 'ApiImage | GetClassType method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_image/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = image')
  end
end

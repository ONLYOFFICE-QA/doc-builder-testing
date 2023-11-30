# frozen_string_literal: true

require 'spec_helper'
describe 'ApiStroke section tests' do
  it 'ApiStroke | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_stroke/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = stroke')
  end

  it 'ApiStroke | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_stroke/to_json.js')
    first_paragraph_text = docx.elements[0].nonempty_runs.first.text
    second_paragraph_text = docx.elements[1].nonempty_runs.first.text
    first_paragraph_json = JSON.parse(first_paragraph_text)
    second_paragraph_json = JSON.parse(second_paragraph_text)
    expect(second_paragraph_json.to_s).to include(first_paragraph_json.to_s)
  end
end

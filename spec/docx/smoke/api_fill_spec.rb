# frozen_string_literal: true

require 'spec_helper'
describe 'ApiFill section tests' do
  it 'ApiFill | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_fill/get_class_type.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('Class Type = fill')
  end

  it 'ApiFill | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_fill/to_json.js')
    first_paragraph_text = docx.elements[0].nonempty_runs.first.text
    second_paragraph_text = docx.elements[1].nonempty_runs.first.text
    first_paragraph_json = JSON.parse(first_paragraph_text)
    second_paragraph_json = JSON.parse(second_paragraph_text)
    expect(second_paragraph_json.to_s).to include(first_paragraph_json.to_s)
  end
end

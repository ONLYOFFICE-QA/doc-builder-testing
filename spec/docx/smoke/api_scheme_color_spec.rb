# frozen_string_literal: true

require 'spec_helper'
describe 'ApiSchemeColor section tests' do
  it 'ApiSchemeColor | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_scheme_color/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = schemeColor')
  end

  it 'ApiSchemeColor | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_scheme_color/to_json.js')
    json = JSON.parse(docx.elements[1].nonempty_runs.first.text)
    expect(docx.elements[0].nonempty_runs.first.text).to eq(json['type'])
    expect(docx.elements[2].nonempty_runs[0].alternate_content.office2007_content.type).to eq(:shape)
  end
end

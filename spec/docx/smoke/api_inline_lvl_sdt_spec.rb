# frozen_string_literal: true

require 'spec_helper'

describe 'ApiInlineLvlSdt section tests' do
  it 'ApiInlineLvlSdt | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_inline_lvl_sdt/to_json.js')
    expect(docx.elements[0].nonempty_runs.first.sdt_content.elements[1].text).to eq('inlineLvlSdt')
    json = JSON.parse(docx.elements[1].nonempty_runs.first.text)
    expect(json['type']).to eq('inlineLvlSdt')
    expect(json['sdtPr']['alias']).to eq('№1')
  end
end

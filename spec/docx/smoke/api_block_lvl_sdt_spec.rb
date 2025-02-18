# frozen_string_literal: true

require 'spec_helper'

describe 'ApiBlockLvlSdt section tests' do
  it 'ApiBlockLvlSdt | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_block_lvl_sdt/to_json.js')
    set_text = docx.elements[0].sdt_content.elements[0].character_style_array[1].text
    expect(set_text).to eq('blockLvlSdt')
    json = JSON.parse(docx.elements[1].nonempty_runs.first.text)
    expect(json['type']).to eq(set_text)
    expect(json['numbering']['type']).to eq('numbering')
  end
end

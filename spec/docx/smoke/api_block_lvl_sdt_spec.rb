# frozen_string_literal: true

require 'spec_helper'

describe 'ApiBlockLvlSdt section tests' do
  it 'ApiBlockLvlSdt | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_block_lvl_sdt/to_json.js')
    expect(docx.elements[0].sdt_content.elements[0].character_style_array[1].text).to eq('blockLvlSdt')
    expect(docx.elements[0].sdt_content.elements[8].numbering.i_level.value).to eq(7)
    json = JSON.parse(docx.elements[1].nonempty_runs.first.text)
    expect(json['type']).to eq('blockLvlSdt')
    expect(json['numbering']['type']).to eq('numbering')
  end
end

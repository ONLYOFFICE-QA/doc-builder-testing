# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRange section tests' do
  it 'ApiRange | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_range/to_json.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('ONLYOFFICE')
    json = JSON.parse(docx.elements[0].nonempty_runs.first.text)
    expect(json['type']).to eq('document')
    expect(json['content'][0]['content'][0]['content'][0]).to eq('ONLYOFFICE')
  end
end

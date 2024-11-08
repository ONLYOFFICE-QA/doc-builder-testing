# frozen_string_literal: true

require 'spec_helper'
describe 'ApiHyperlink tests' do
  it 'ApiHyperlink | ToJSON methods' do
    docx = builder.build_and_parse('js/docx/smoke/api_hyperlink/to_json.js')
    expect(docx.elements[0].nonempty_runs.first.text).to eq('ONLYOFFICE Document Builder')
    expect(docx.elements[0].nonempty_runs.first.link.url).to eq('https://legacy-api.onlyoffice.com/')
    json = JSON.parse(docx.elements[1].nonempty_runs.first.text)
    expect(json['type']).to eq('hyperlink')
    expect(json['value']).to eq('https://legacy-api.onlyoffice.com/')
    expect(json['tooltip']).to eq('ONLYOFFICE for developers')
    expect(json['styles']['186']['name']).to eq('Hyperlink')
  end
end

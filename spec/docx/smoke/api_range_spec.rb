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

  describe 'ApiRange | GetRange method' do
    it 'Check GetRange default' do
      docx = builder.build_and_parse('js/docx/smoke/api_range/get_range.js')
      style = OoxmlParser::FontStyle.new(true)
      expect(docx.elements[0].nonempty_runs.size).to eq(3)

      expect(docx.elements[0].nonempty_runs[0].text).to eq('ONLYOFFICE')
      expect(docx.elements[0].nonempty_runs[0].font_style).to eq(style)
      expect(docx.elements[0].nonempty_runs[0].font_color.to_s).to eq('RGB (255, 0, 0)')

      expect(docx.elements[0].nonempty_runs[1].text).to eq(' Document ')
      expect(docx.elements[0].nonempty_runs[1].font_style).to eq(style)
      expect(docx.elements[0].nonempty_runs[1].font_color).to eq(OoxmlParser::Color.new)

      style.italic = true
      expect(docx.elements[0].nonempty_runs[2].text).to eq('Builder')
      expect(docx.elements[0].nonempty_runs[2].font_style).to eq(style)
      expect(docx.elements[0].nonempty_runs[2].font_color).to eq(OoxmlParser::Color.new)
    end
  end
end

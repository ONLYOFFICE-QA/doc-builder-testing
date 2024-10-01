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
    let(:style) { OoxmlParser::FontStyle.new(true, true) }
    let(:docx) { builder.build_and_parse('js/docx/smoke/api_range/get_range.js') }

    it 'Check document structure' do
      expect(docx.elements[0].nonempty_runs.size).to eq(1)
      expect(docx.elements[1].nonempty_runs.size).to eq(4)
    end

    it 'Check method for document' do
      style.italic = false
      expect(docx.elements[0].nonempty_runs[0].text).to eq('Document Builder')
      expect(docx.elements[0].nonempty_runs[0].font_style).to eq(style)
      expect(docx.elements[0].nonempty_runs[0].font_color).to eq(OoxmlParser::Color.new)

      expect(docx.elements[1].nonempty_runs[3].text).to eq('method')
      expect(docx.elements[1].nonempty_runs[3].font_style).to eq(style)
      expect(docx.elements[1].nonempty_runs[3].font_color).to eq(OoxmlParser::Color.new)
    end

    it 'Check method for paragraph' do
      expect(docx.elements[1].nonempty_runs[0].text).to eq('Check ')
      expect(docx.elements[1].nonempty_runs[0].font_style).to eq(style)
      expect(docx.elements[1].nonempty_runs[0].font_color).to eq(OoxmlParser::Color.new)

      expect(docx.elements[1].nonempty_runs[2].text).to eq('nge ')
      expect(docx.elements[1].nonempty_runs[2].font_style).to eq(style)
      expect(docx.elements[1].nonempty_runs[2].font_color).to eq(OoxmlParser::Color.new)
    end

    it 'Check method for another range' do
      expect(docx.elements[1].nonempty_runs[1].text).to eq('GetRa')
      expect(docx.elements[1].nonempty_runs[1].font_style).to eq(style)
      expect(docx.elements[1].nonempty_runs[1].font_color.to_s).to eq('RGB (255, 0, 0)')
    end

    it 'Check method with parameters 0, 17' do
      docx = builder.build_and_parse('js/docx/smoke/api_range/get_range_with_params.js', start_pos: 0, end_pos: 17)
      expect(docx.elements.size).to eq(1)
      expect(docx.elements[0].nonempty_runs.size).to eq(2)

      expect(docx.elements[0].nonempty_runs[0].text).to eq('Document Builder')
      expect(docx.elements[0].nonempty_runs[0].font_style).to eq(OoxmlParser::FontStyle.new(true))
      expect(docx.elements[0].nonempty_runs[1].text).to eq(' check GetRange method')
      expect(docx.elements[0].nonempty_runs[1].font_style).to eq(OoxmlParser::FontStyle.new)
    end

    it 'Check method with parameters 10, 24' do
      docx = builder.build_and_parse('js/docx/smoke/api_range/get_range_with_params.js', start_pos: 10, end_pos: 24)
      expect(docx.elements.size).to eq(1)
      expect(docx.elements[0].nonempty_runs.size).to eq(3)

      expect(docx.elements[0].nonempty_runs[0].text).to eq('Document ')
      expect(docx.elements[0].nonempty_runs[0].font_style).to eq(OoxmlParser::FontStyle.new)
      expect(docx.elements[0].nonempty_runs[1].text).to eq('Builder check ')
      expect(docx.elements[0].nonempty_runs[1].font_style).to eq(OoxmlParser::FontStyle.new(true))
      expect(docx.elements[0].nonempty_runs[2].text).to eq('GetRange method')
      expect(docx.elements[0].nonempty_runs[2].font_style).to eq(OoxmlParser::FontStyle.new)
    end
  end
end

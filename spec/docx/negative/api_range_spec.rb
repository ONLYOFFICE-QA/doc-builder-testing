# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRange section negative tests' do
  describe 'ApiRange | GetRange method' do
    let(:style) { OoxmlParser::FontStyle.new }
    let(:file_path) { 'js/docx/negative/api_range/get_range.js' }

    it 'Check method with wrong parameters 0, -1' do
      docx = builder.build_and_parse(file_path, start_pos: 0, end_pos: -1)
      expect(docx.elements.size).to eq(1)
      expect(docx.elements.first.nonempty_runs.size).to eq(1)
      expect(docx.elements.first.nonempty_runs.first.font_style).to eq(OoxmlParser::FontStyle.new)
    end

    it 'Check method with parameters -1, 0' do
      docx = builder.build_and_parse(file_path, start_pos: -1, end_pos: 0)
      expect(docx.elements.size).to eq(1)
      expect(docx.elements.first.nonempty_runs.size).to eq(1)
      expect(docx.elements.first.nonempty_runs.first.font_style).to eq(OoxmlParser::FontStyle.new)
    end

    it 'Check method with wrong parameters 0.2, 16.5' do
      docx = builder.build_and_parse(file_path, start_pos: 0.2, end_pos: 16.5)
      expect(docx.elements.size).to eq(1)
      expect(docx.elements.first.nonempty_runs.size).to eq(1)
      expect(docx.elements.first.nonempty_runs.first.font_style).to eq(OoxmlParser::FontStyle.new)
    end

    it 'Check method with wrong parameters "5", "13"' do
      docx = builder.build_and_parse(file_path, start_pos: '5', end_pos: '13')
      expect(docx.elements.size).to eq(1)
      expect(docx.elements.first.nonempty_runs.size).to eq(1)
      expect(docx.elements.first.nonempty_runs.first.font_style).to eq(OoxmlParser::FontStyle.new)
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRange section negative tests' do
  describe 'ApiRange | GetRange method' do
    let(:style) { OoxmlParser::FontStyle.new }
    let(:file_path) { 'js/docx/smoke/api_range/get_range_with_params.js' }
    let(:error_text) { /TypeError: Cannot read property 'SetBold' of null\n/ }

    before { skip('Fix after moving to sending the script as a static file') if web_builder? }

    it 'Check method with wrong parameters 0, -1' do
      if builder.semver >= Semantic::Version.new('9.0.0')
        expect { builder.build_and_parse(file_path, start_pos: 0, end_pos: -1) }.to raise_error(DocBuilderError, error_text)
      else
        docx = builder.build_and_parse(file_path, start_pos: 0, end_pos: -1)
        expect(docx.elements.size).to eq(1)
        expect(docx.elements.first.nonempty_runs.size).to eq(1)
        expect(docx.elements.first.nonempty_runs.first.font_style).to eq(OoxmlParser::FontStyle.new)
      end
    end

    it 'Check method with parameters -1, 0' do
      if builder.semver >= Semantic::Version.new('9.0.0')
        expect { builder.build_and_parse(file_path, start_pos: -1, end_pos: 0) }.to raise_error(DocBuilderError, error_text)
      else
        docx = builder.build_and_parse(file_path, start_pos: -1, end_pos: 0)
        expect(docx.elements.size).to eq(1)
        expect(docx.elements.first.nonempty_runs.size).to eq(1)
        expect(docx.elements.first.nonempty_runs.first.font_style).to eq(OoxmlParser::FontStyle.new)
      end
    end

    it 'Check method with wrong parameters 0.2, 16.5' do
      if builder.semver >= Semantic::Version.new('9.0.0')
        expect { builder.build_and_parse(file_path, start_pos: 0.2, end_pos: 16.5) }.to raise_error(DocBuilderError, error_text)
      else
        docx = builder.build_and_parse(file_path, start_pos: 0.2, end_pos: 16.5)
        expect(docx.elements.size).to eq(1)
        expect(docx.elements.first.nonempty_runs.size).to eq(1)
        expect(docx.elements.first.nonempty_runs.first.font_style).to eq(OoxmlParser::FontStyle.new)
      end
    end

    it 'Check method with wrong parameters "5", "13"' do
      if builder.semver >= Semantic::Version.new('9.0.0')
        expect { builder.build_and_parse(file_path, start_pos: '5', end_pos: '13') }.to raise_error(DocBuilderError, error_text)
      else
        docx = builder.build_and_parse(file_path, start_pos: '5', end_pos: '13')
        expect(docx.elements.size).to eq(1)
        expect(docx.elements.first.nonempty_runs.size).to eq(1)
        expect(docx.elements.first.nonempty_runs.first.font_style).to eq(OoxmlParser::FontStyle.new)
      end
    end
  end
end

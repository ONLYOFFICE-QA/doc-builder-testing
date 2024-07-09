# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRange section negative tests' do
  describe 'ApiRange | GetRange method' do
    let(:style) { OoxmlParser::FontStyle.new }
    let(:template_path) { 'js/docx/negative/api_range/get_range_wrong_ranges.js' }
    let(:file_path) { 'js/docx/negative/api_range/get_range_tmp.js' }

    after do
      FileUtils.rm_f(file_path)
    end

    def create_builder_script(file_path, start_pos, end_pos)
      script = File.read(template_path)
      script = script.sub('{start_pos}', start_pos.to_s).sub('{end_pos}', end_pos.to_s)
      file = File.new(file_path, 'w')
      file.puts(script)
      file.close
    end

    [[0, -1], [-1, 0], [10.2, 16.5], ['"5"', '"13"']].each do |params|
      it "Check method with wrong parameters: #{params}" do
        create_builder_script(file_path, *params)
        docx = builder.build_and_parse(file_path)
        expect(docx.elements.size).to eq(1)
        expect(docx.elements.first.nonempty_runs.size).to eq(1)
        expect(docx.elements.first.nonempty_runs.first.font_style).to eq(OoxmlParser::FontStyle.new)
      end
    end
  end
end

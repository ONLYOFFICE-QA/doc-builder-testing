# frozen_string_literal: true

require 'spec_helper'

describe 'My behaviour' do
  let(:simple_script) { 'asserts/js/wrapper/add_text_with_bold_in_paragraph.js' }
  let(:simple_script_windows) { 'asserts/js/wrapper/add_text_with_bold_in_paragraph_windows.js' }
  let(:simple_xlsx_script) { 'asserts/js/wrapper/simplest_xlsx_file.js' }

  describe 'build_doc' do
    it 'raises correct error if input file is incorrect' do
      skip if ENV['BUILDER_PLATFORM'] == 'WEB'
      expect { builder.build('test') }.to raise_error(DocBuilderError, /error: cannot read run file\n/)
    end

    it '[WEB] should raise correct error if input file is incorrect' do
      skip unless ENV['BUILDER_PLATFORM'] == 'WEB'
      expect { builder.build('test') }.to raise_error(WebDocBuilderError, 'Filepath is incorrect')
    end

    it 'does not raise error if output path is incorrect' do
      skip if ENV['BUILDER_PLATFORM'] == 'WEB'
      FileUtils.rm_rf('/tmp/docbuilder-testing')
      if Gem.win_platform?
        expect(builder.build(simple_script_windows)).to be_nil
      else
        expect(builder.build(simple_script)).to be_nil
      end
      FileUtils.rm_rf('/tmp/docbuilder-testing')
    end

    it '[WEB] should not raise error if output path is incorrect' do
      skip unless ENV['BUILDER_PLATFORM'] == 'WEB'
      FileUtils.rm_rf('/tmp/docbuilder-testing')
      expect { builder.build('test') }.to raise_error(WebDocBuilderError, 'Filepath is incorrect')
      FileUtils.rm_rf('/tmp/docbuilder-testing')
    end
  end

  describe 'change_output_file' do
    it 'check that change output file do not change original file' do
      before_change = File.binread(simple_script)
      builder.change_output_file(simple_script)
      after_change = File.binread(simple_script)
      expect(before_change).to eq(after_change)
    end

    it 'check that changed file contain returned values' do
      rebuild_result = builder.change_output_file(simple_script)
      expect(File.binread(rebuild_result[:temp_script_file].path)).to include(rebuild_result[:output_file])
    end

    it 'Check that temp script file is same format as original file' do
      rebuild_result = builder.change_output_file(simple_script)
      expect(File.extname(rebuild_result[:temp_script_file])).to eq(File.extname(simple_script))
    end

    it 'Check that temp output file is docx' do
      rebuild_result = builder.change_output_file(simple_script)
      expect(File.extname(rebuild_result[:output_file])).to eq('.docx')
    end
  end

  describe 'build_doc_and_parse' do
    it 'check that parsing is performed' do
      expect(builder.build_and_parse(simple_script)).to be_a(OoxmlParser::DocumentStructure)
    end

    it 'check that build is performed with script with russian letters' do
      expect(builder.build_and_parse('asserts/js/docx/paragraph/text/add_text_in_header.js')).to be_a(OoxmlParser::DocumentStructure)
    end
  end

  describe 'check_support_of_xlsx' do
    it 'check that parsing is performed' do
      expect(builder.build_and_parse(simple_xlsx_script)).to be_a(OoxmlParser::XLSXWorkbook)
    end

    it 'check that builded xlsx file have correct extension' do
      xlsx = builder.build_and_parse(simple_xlsx_script)
      expect(File.extname(xlsx.file_path)).to eq('.xlsx')
    end
  end
end

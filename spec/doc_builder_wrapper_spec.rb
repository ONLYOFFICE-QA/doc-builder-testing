require 'spec_helper'

describe 'My behaviour' do
  let(:builder) { DocBuilderWrapper.new }
  let(:simple_script) { 'asserts/js/wrapper/add_text_with_bold_in_paragraph.js' }
  let(:simple_xlsx_script) { 'asserts/js/wrapper/simplest_xlsx_file.js' }

  describe 'build_doc' do
    it 'should raise correct error if input file is incorrect' do
      expect { builder.build_doc('test') }.to raise_error(DocBuilderError, /error: cannot read run file\n/)
    end

    it 'should not raise error if output path is incorrect' do
      FileUtils.rm_rf('/tmp/docbuilder-testing')
      expect(builder.build_doc(simple_script)).to be_nil
      FileUtils.rm_rf('/tmp/docbuilder-testing')
    end
  end

  describe 'change_output_file' do
    it 'check that change output file do not change original file' do
      before_change = File.open(simple_script, 'rb').read
      DocBuilderWrapper.change_output_file(simple_script)
      after_change = File.open(simple_script, 'rb').read
      expect(before_change).to eq(after_change)
    end

    it 'check that changed file contain returned values' do
      rebuild_result = DocBuilderWrapper.change_output_file(simple_script)
      expect(File.open(rebuild_result[:temp_script_file], 'rb').read).to include(rebuild_result[:temp_output_file])
    end

    it 'Check that temp script file is same format as original file' do
      rebuild_result = DocBuilderWrapper.change_output_file(simple_script)
      expect(File.extname(rebuild_result[:temp_script_file])).to eq(File.extname(simple_script))
    end

    it 'Check that temp output file is docx' do
      rebuild_result = DocBuilderWrapper.change_output_file(simple_script)
      expect(File.extname(rebuild_result[:temp_output_file])).to eq('.docx')
    end
  end

  describe 'build_doc_and_parse' do
    it 'check that parsing is performed' do
      expect(builder.build_doc_and_parse(simple_script)).to be_a(OoxmlParser::DocumentStructure)
    end

    it 'check that build is performed with script with russian letters' do
      expect(builder.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_in_header.js')).to be_a(OoxmlParser::DocumentStructure)
    end
  end

  describe 'check_support_of_xlsx' do
    it 'check that parsing is performed' do
      expect(builder.build_doc_and_parse(simple_xlsx_script)).to be_a(OoxmlParser::XLSXWorkbook)
    end

    it 'check that builded xlsx file have correct extension' do
      xlsx = builder.build_doc_and_parse(simple_xlsx_script)
      expect(File.extname(xlsx.file_path)).to eq('.xlsx')
    end
  end
end

require 'rspec'
require_relative '../lib/doc_builder_testing'

describe 'My behaviour' do
  let(:builder) { DocBuilderWrapper.new }
  let(:simple_script) { 'asserts/js/Paragraph/Text/add_text_in_paragraph.js' }

  it 'should raise correct error if input file is incorrect' do
    expect(builder.build_doc('test')).to eq("error: cannot read run file\n")
  end

  it 'should raise error if output path is incorrect' do
    expect(builder.build_doc(simple_script)).to eq("error: : save file error\n")
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
      expect(File.open(rebuild_result[:temp_script_file], 'rb').read).to include(rebuild_result[:temp_output_file].path)
    end
  end
end
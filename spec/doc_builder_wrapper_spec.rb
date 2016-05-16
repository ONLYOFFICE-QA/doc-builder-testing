require 'rspec'
require_relative '../lib/doc_builder_testing'

describe 'My behaviour' do
  let(:builder) { DocBuilderWrapper.new }

  it 'should raise correct error if input file is incorrect' do
    expect(builder.build_doc('test')).to eq("error: cannot read run file\n")
  end

  it 'should raise error if output path is incorrect' do
    expect(builder.build_doc('asserts/js/Paragraph/Text/add_text_in_paragraph.js')).to eq("error: : save file error\n")
  end
end
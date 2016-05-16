require 'rspec'
require_relative '../lib/doc_builder_testing'

describe 'My behaviour' do
  let(:builder) { DocBuilderWrapper.new }

  it 'should raise correct error if input file is incorrect' do
    expect(builder.build_doc('test')).to eq("error: cannot read run file\n")
  end
end
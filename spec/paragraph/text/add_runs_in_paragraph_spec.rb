require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'

describe 'Add runs in paragraph' do

  it 'Add Run' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/paragraph/text/add_run_after.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Run	StopRun')
  end

  it 'Add Run' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/paragraph/text/add_run_after.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Run	StopRun')
  end
  end




require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'

describe 'My behaviour' do
  it 'Check Diagram offset should !=0' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/Paragraph/Text/add_text_in_paragraph.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('test')
  end
end

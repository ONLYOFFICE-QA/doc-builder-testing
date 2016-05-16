require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'

describe 'Check contextual spacing' do

  it 'Contextual spacing' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/Paragraph/Text/add_text_with_contextualspacing.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('True')
    expect(docx.elements[1].contextual_spacing).to eq(true)
  end
end

require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'

describe 'Check backgroundcolor' do

  it 'Backgroundcolor' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/Paragraph/Text/add_text_with_backgroundcolor_in_paragraph.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Green')
    expect(docx.elements[1].background_color).to eq(OoxmlParser::Color.new(0,255,0))
end
end

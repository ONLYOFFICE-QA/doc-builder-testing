require 'spec_helper'

describe 'Check backgroundcolor' do
  it 'Backgroundcolor' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_backgroundcolor.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Green')
    expect(docx.elements[1].background_color).to eq(OoxmlParser::Color.new(0, 255, 0))
  end
end

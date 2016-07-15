require 'spec_helper'

describe 'My behaviour' do
  it 'Check Diagram offset should !=0' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_in_paragraph.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('test')
  end
end

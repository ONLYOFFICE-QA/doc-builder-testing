require 'spec_helper'

describe 'text with tabs' do
  it 'Tabs' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_tabs.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Tabs')
    expect(docx.elements[1].tabs.first.position).to eq(1.76)
    expect(docx.elements[1].tabs.first.align).to eq(:center)
    expect(docx.elements[1].tabs[1].position).to eq(2.65)
    expect(docx.elements[1].tabs[1].align).to eq(:left)
    expect(docx.elements[1].tabs[2].position).to eq(5.29)
    expect(docx.elements[1].tabs[2].align).to eq(:right)
  end
end

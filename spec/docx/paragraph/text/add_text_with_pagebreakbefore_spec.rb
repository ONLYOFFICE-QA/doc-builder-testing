require 'bundler/setup'
require 'rspec'
require_relative '../../../../lib/doc_builder_testing'

describe 'Check pagebreak' do

  it 'Pagebreak' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/text/add_text_with_pagebreakbefore.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('PageBreakBefore')
    expect(docx.elements[1].page_break).to eq(true)
  end
end

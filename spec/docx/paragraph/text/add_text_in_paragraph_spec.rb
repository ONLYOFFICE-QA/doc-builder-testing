require 'spec_helper'

describe 'My behaviour' do
  it 'Check Diagram offset should !=0' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/text/add_text_in_paragraph.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('test')
  end
end

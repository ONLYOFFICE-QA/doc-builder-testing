require 'spec_helper'

describe 'Check backgroundcolor' do
  it 'Backgroundcolor' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/text/add_text_with_backgroundcolor.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Green')
    expect(docx.elements[1].background_color).to eq(OoxmlParser::Color.new(0, 255, 0))
  end
end

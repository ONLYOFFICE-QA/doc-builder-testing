# frozen_string_literal: true

require 'spec_helper'

describe 'text with tabs' do
  it 'Tabs' do
    docx = builder.build_and_parse('js/docx/paragraph/text/add_text_with_tabs.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Tabs')
    expect(docx.elements[1].paragraph_properties.tabs[0].position).to eq(OoxmlParser::OoxmlSize.new(1.76, :centimeter))
    expect(docx.elements[1].paragraph_properties.tabs[0].align).to eq(:center)
    expect(docx.elements[1].paragraph_properties.tabs[1].position).to eq(OoxmlParser::OoxmlSize.new(2.65, :centimeter))
    expect(docx.elements[1].paragraph_properties.tabs[1].align).to eq(:left)
    expect(docx.elements[1].paragraph_properties.tabs[2].position).to eq(OoxmlParser::OoxmlSize.new(5.29, :centimeter))
    expect(docx.elements[1].paragraph_properties.tabs[2].align).to eq(:right)
  end
end

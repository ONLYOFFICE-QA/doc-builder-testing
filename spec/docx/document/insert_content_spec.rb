# frozen_string_literal: true

require 'spec_helper'

describe 'Insert content' do
  it 'Insert | Inline TextForm', :critical do
    docx = builder.build_and_parse('js/form/text_form/inline_insert_text_form.js')
    expect(docx.elements.size).to eq(1)
    expect(docx.elements[0].sdt.sdt_content.elements.first.text).to eq('placeholder')
  end

  it 'Insert | TextForm as an element', :critical do
    docx = builder.build_and_parse('js/form/text_form/insert_text_form.js')
    expect(docx.elements.size).to eq(2)
    expect(docx.elements[0].sdt.sdt_content.elements.first.text).to eq('placeholder')
  end
end

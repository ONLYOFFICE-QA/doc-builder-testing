# frozen_string_literal: true

require 'spec_helper'

describe 'Check contextual spacing' do
  it 'Contextual spacing' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/text/add_text_with_contextualspacing.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('True')
    expect(docx.elements[1].contextual_spacing).to eq(true)
  end
end

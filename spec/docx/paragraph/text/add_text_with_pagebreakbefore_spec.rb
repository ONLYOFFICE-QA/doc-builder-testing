# frozen_string_literal: true

require 'spec_helper'

describe 'Check pagebreak' do
  it 'Pagebreak' do
    docx = builder.build_and_parse('js/docx/paragraph/text/add_text_with_pagebreakbefore.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('PageBreakBefore')
    expect(docx.elements[1].page_break).to be(true)
  end
end

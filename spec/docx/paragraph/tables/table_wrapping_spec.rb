require 'spec_helper'

describe 'Add tables with wrap and no wrap' do
  it 'Table with wrap' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/tables/table_with_wrap.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells.first.elements.first.nonempty_runs.first.text).to eq('Wrap')
    expect(docx.elements[1].rows.first.cells.first.elements.first.nonempty_runs.first.w).to eq(false)
  end

  it 'Table with no wrap' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/paragraph/tables/table_with_nowrap.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].rows.first.cells[1].elements.first.nonempty_runs.first.text).to eq('No wrap')
    expect(docx.elements[1].rows.first.cells[1].elements.first.nonempty_runs.first.w).to eq(false)
  end
end

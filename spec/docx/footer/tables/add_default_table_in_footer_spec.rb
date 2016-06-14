require 'bundler/setup'
require 'rspec'
require_relative '../../../../lib/doc_builder_testing'

describe 'Add deafult table in footer' do

  it 'Default table in footer ' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/footer/tables/add_table_in_footer.js')
    expect(docx.notes.first.elements[1].rows.length).to eq(3)
  end

  it 'Table with right alignment' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/footer/tables/add_table_in_footer_right.js')
    expect(docx.notes.first.elements[1].rows.length).to eq(3)
    expect(docx.notes.first.elements[1].properties.jc).to eq(:right)

  end
end




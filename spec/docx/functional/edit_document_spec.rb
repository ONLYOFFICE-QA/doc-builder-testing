require 'spec_helper'
describe 'Edit existing document' do
  it 'Edit document | only_paragraph.docx | add paragraph' do
    pending 'http://bugzilla.onlyoffice.com/show_bug.cgi?id=36084' if ENV['BUILDER_PLATFORM'] == 'WEB'
    docx = builder.build_and_parse('asserts/js/docx/functional/edit_document_only_paragraph.js')
    expect(docx.elements.first.nonempty_runs.last.text).to eq('Center')
    expect(docx.elements.first.align).to eq(:center)
  end

  it 'Edit document | only_paragraph.docx | change color of test' do
    pending 'http://bugzilla.onlyoffice.com/show_bug.cgi?id=36084' if ENV['BUILDER_PLATFORM'] == 'WEB'
    docx = builder.build_and_parse('asserts/js/docx/functional/edit_document_only_paragraph_change_color.js')
    expect(docx.elements.first.nonempty_runs.first.font_color).to eq(OoxmlParser::Color.new(0, 0, 255))
  end
end

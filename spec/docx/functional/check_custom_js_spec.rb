require 'spec_helper'
describe 'javascript code injection' do
  it 'check add type of value | bold_report' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/functional/custom_js/bold_report.js')
    expect(docx).to be_with_data
  end

  it 'check add type of value | bold_report' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/functional/custom_js/christmas_note_cards.js')
    expect(docx).to be_with_data
  end

  it 'check add type of value | fax_cover' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/functional/custom_js/fax_cover.js')
    expect(docx).to be_with_data
  end

  it 'check add type of value | menu1_code' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/functional/custom_js/menu1_code.js')
    expect(docx).to be_with_data
  end

  it 'check add type of value | priglashenie' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/functional/custom_js/priglashenie.js')
    expect(docx).to be_with_data
  end

  it 'check add type of value | rsvp_cards' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/functional/custom_js/rsvp_cards.js')
    expect(docx).to be_with_data
  end
end

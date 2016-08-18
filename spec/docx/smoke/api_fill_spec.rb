require 'spec_helper'
describe 'ApiFill section tests' do
  it 'ApiFill | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiFill/getclasstype.js')
    expect(docx.elements.first.character_style_array[2].text).to eq('Class Type = fill')
  end
end

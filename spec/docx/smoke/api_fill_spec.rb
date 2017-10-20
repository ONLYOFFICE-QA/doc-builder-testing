require 'spec_helper'
describe 'ApiFill section tests' do
  it 'ApiFill | GetClassType method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_fill/get_class_type.js')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('Class Type = fill')
  end
end

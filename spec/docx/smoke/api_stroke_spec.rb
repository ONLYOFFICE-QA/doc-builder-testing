require 'spec_helper'
describe 'ApiStroke section tests' do
  it 'ApiStroke | GetClassType method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiStroke/getclasstype.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = stroke')
  end
end

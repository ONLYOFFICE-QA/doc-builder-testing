require 'spec_helper'
describe 'ApiImage section tests' do
  it 'ApiImage | GetClassType method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiImage/getclasstype.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = image')
  end
end

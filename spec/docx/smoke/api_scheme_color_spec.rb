require 'spec_helper'
describe 'ApiSchemeColor section tests' do
  it 'ApiSchemeColor | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSchemeColor/getclasstype.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = schemeColor')
  end
end

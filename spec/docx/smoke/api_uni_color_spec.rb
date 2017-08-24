require 'spec_helper'
describe 'ApiUniColor section tests' do
  it 'ApiUniColor | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiUniColor/getclasstype.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = presetColor')
  end
end

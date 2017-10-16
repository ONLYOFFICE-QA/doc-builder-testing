require 'spec_helper'
describe 'ApiPresetColor section tests' do
  it 'ApiPresetColor | GetClassType method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiPresetColor/getclasstype.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = presetColor')
  end
end

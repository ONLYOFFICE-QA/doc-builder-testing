require 'spec_helper'
describe 'ApiSchemeColor section tests' do
  it 'ApiSchemeColor | GetClassType method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_scheme_color/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = schemeColor')
  end
end

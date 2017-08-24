require 'spec_helper'
describe 'ApiRGBColor section tests' do
  it 'ApiRGBColor | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiRGBColor/getclasstype.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = rgbColor')
  end
end

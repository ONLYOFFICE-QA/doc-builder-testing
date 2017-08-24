require 'spec_helper'
describe 'ApiNumbering section tests' do
  it 'ApiNumbering | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumbering/getclasstype.js')
    expect(docx.elements.last.nonempty_runs.first.text).to eq('Class Type = numbering')
  end

  it 'ApiNumbering | GetLevel method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiNumbering/getlevel.js')
    docx.elements[1..docx.elements.size].each_with_index do |current_element, index|
      expect(current_element.nonempty_runs.first.text).to eq("Default bullet lvl #{index + 1}")
      expect(current_element.numbering.ilvl).to eq(index)
    end
  end
end

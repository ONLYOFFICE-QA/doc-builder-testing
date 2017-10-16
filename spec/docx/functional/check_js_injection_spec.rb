require 'spec_helper'
describe 'javascript code injection' do
  it 'check add type of value | Numbering' do
    docx = builder.build_doc_and_parse('asserts/js/docx/functional/check_add_type_of_value_number.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('Numbers: 1 2 1.999999999999999 2')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('If 1 / 0 : Infinity')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('hex 0xFF (to be eq 255) :255')
    expect(docx.elements.first.nonempty_runs[3].text).to eq('scientific format 3e5 (to be eq 300000) :300000')
  end

  it 'check add and use new function' do
    docx = builder.build_doc_and_parse('asserts/js/docx/functional/check_add_and_use_functions.js')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('Hello Word')
    expect(docx.elements.first.nonempty_runs.size).to eq(1)
  end
end

require 'spec_helper'

describe 'Add runs in paragraph' do
  it 'Add Run' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/text/add_run_after.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Run	StopRun')
  end

  it 'Add Run' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/text/add_run_after.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Run	StopRun')
  end
end

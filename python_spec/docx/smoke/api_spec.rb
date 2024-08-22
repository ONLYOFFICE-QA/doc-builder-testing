# frozen_string_literal: true

require_relative '../../spec_helper'
describe 'Api section tests', :critical do
  it 'Api method' do
    docx = builder.build_and_parse('python/docx/smoke/api/script.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Hello, World!')
  end
end

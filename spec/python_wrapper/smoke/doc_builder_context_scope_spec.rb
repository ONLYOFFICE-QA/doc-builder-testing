# frozen_string_literal: true

require 'spec_helper'
describe 'CDocBuilderContextScope tests' do
  it 'CDocBuilderContextScope | Close method' do
    temp_script_data = python_builder.change_output_file('python/wrapper/smoke/doc_builder_context_scope/close.py')
    python_builder.build(temp_script_data[:temp_script_file].path)
    expect(File.exist?(temp_script_data[:output_file])).to be(false)
  end
end

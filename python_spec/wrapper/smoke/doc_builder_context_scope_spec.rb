# frozen_string_literal: true

require_relative '../../spec_helper'
describe 'CDocBuilderContextScope tests', :critical do
  it 'CDocBuilderContextScope | Close method' do
    temp_script_data = builder.change_output_file('python/wrapper/smoke/doc_builder_context_scope/close.py')
    builder.build(temp_script_data[:temp_script_file].path)
    expect(File.exist?(temp_script_data[:output_file])).to be(false)
  end
end

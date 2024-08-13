# frozen_string_literal: true

require_relative '../../spec_helper'

describe DocBuilderWrapper do
  let(:builder) { described_class.new }
  let(:file_path) { 'project_spec/integration/doc_builder_wrapper/js/check_argument.js' }

  context 'without arguments' do
    it 'build method' do
      temp_script_data = builder.change_output_file(file_path)
      expect { builder.build(temp_script_data[:temp_script_file].path) }.not_to raise_error(DocBuilderError)
    end

    it 'build_and_parse method' do
      docx = builder.build_and_parse(file_path)
      expect(docx.elements.first.nonempty_runs.first.text).to eq('Argument: {}')
    end
  end

  context 'with arguments' do
    let(:argument) { { string: 'Value', number: 3.14, boolean: true, hash: { key: 'value' } } }
    let(:argument_with_spaces) { { key: 'Some value with spaces' } }

    it 'build method' do
      temp_script_data = builder.change_output_file(file_path)
      expect { builder.build(temp_script_data[:temp_script_file].path, **argument) }.not_to raise_error(DocBuilderError)
    end

    it 'build method, argument with space' do
      skip 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=69321'
      temp_script_data = builder.change_output_file(file_path)
      expect { builder.build(temp_script_data[:temp_script_file].path, **argument_with_spaces) }.not_to raise_error(DocBuilderError)
    end

    it 'build_and_parse method' do
      docx = builder.build_and_parse(file_path, **argument)
      expect(docx.elements.first.nonempty_runs.first.text).to eq("Argument: #{argument.to_json}")
    end

    it 'build_and_parse method, argument with space' do
      skip 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=69321'
      docx = builder.build_and_parse(file_path, **argument_with_spaces)
      expect(docx.elements.first.nonempty_runs.first.text).to eq("Argument: #{argument_with_spaces.to_json}")
    end
  end
end

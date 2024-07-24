# frozen_string_literal: true

require_relative '../spec_helper'

describe DocBuilderWrapper do
  let(:file_path) { 'unit/doc_builder_wrapper/js/check_argument.js' }
  let(:builder) { described_class.new }

  context 'without arguments' do
    it 'build method' do
      expect { builder.build(file_path) }.not_to raise_error(DocBuilderError)
    end

    it 'build_and_parse method' do
      docx = builder.build_and_parse('unit/doc_builder_wrapper/js/check_argument.js')
      expect(docx.elements.first.nonempty_runs.first.text).to eq('Argument: {}')
    end
  end

  context 'with arguments' do
    let(:argument) { { string: 'Value', number: 3.14, boolean: true } }
    let(:argument_with_spaces) { { key: 'Some value with spaces' } }

    it 'build method' do
      expect { builder.build(file_path, **argument) }.not_to raise_error(DocBuilderError)
    end

    it 'build method, argument with space' do
      skip 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=69321'
      expect { builder.build(file_path, **argument_with_spaces) }.not_to raise_error(DocBuilderError)
    end

    it 'build_and_parse method' do
      docx = builder.build_and_parse('unit/doc_builder_wrapper/js/check_argument.js', **argument)
      expect(docx.elements.first.nonempty_runs.first.text).to eq("Argument: #{argument.to_json}")
    end

    it 'build_and_parse method, argument with space' do
      skip 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=69321'
      docx = builder.build_and_parse('unit/doc_builder_wrapper/js/check_argument.js', **argument_with_spaces)
      expect(docx.elements.first.nonempty_runs.first.text).to eq("Argument: #{argument_with_spaces.to_json}")
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'
describe 'CDocBuilderContext tests' do
  before { skip 'incompatible changes' if builder.semver < Semantic::Version.new('8.2.0') }

  it 'CDocBuilderContext | CreateArray method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_context/create_array.py')
    expect(docx.elements[0].nonempty_runs[0].text).to eq('CreateArray')
    expect(docx.elements[1].nonempty_runs[0].text).to eq('test')
  end

  it 'CDocBuilderContext | CreateNull method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_context/create_null.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Value is null = True')
  end

  it 'CDocBuilderContext | CreateObject method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_context/create_object.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Value is object = True')
  end

  # Creates context scope for script, at least one scope must be open
  it 'CDocBuilderContext | CreateScope method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_context/create_scope.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq("Without CreateScope script doesn't work")
  end

  it 'CDocBuilderContext | CreateUndefined method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_context/create_undefined.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Value is undefined = True')
  end

  it 'CDocBuilderContext | GetGlobal method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_context/get_global.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('If this paragraph is here, GetGlobal works')
  end

  it 'CDocBuilderContext | IsError method' do
    temp_script_data = python_builder.change_output_file('python/wrapper/smoke/doc_builder_context/is_error.py')
    expect { python_builder.build(temp_script_data[:temp_script_file].path) }.to raise_error(include('TypeError: Api.GetParagraph is not a function'))
  end
end

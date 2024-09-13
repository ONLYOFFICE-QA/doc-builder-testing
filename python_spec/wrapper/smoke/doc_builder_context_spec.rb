# frozen_string_literal: true

require_relative '../../spec_helper'
describe 'CDocBuilderContext tests', :critical do
  it 'CDocBuilderContext | CreateArray method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_context/create_array.py')
    expect(docx.elements[0].nonempty_runs[0].text).to eq('CreateArray')
    expect(docx.elements[1].nonempty_runs[0].text).to eq('test')
  end

  it 'CDocBuilderContext | CreateNull method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_context/create_null.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Value is null = True')
  end

  # it 'CDocBuilderContext | CreateObject method' do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_context/create_object.py')
  #   expect('').to eq('')
  # end

  it 'CDocBuilderContext | CreateScope method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_context/create_scope.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq("Without CreateScope script doesn't works")
  end

  it 'CDocBuilderContext | CreateUndefined method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_context/create_undefined.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Value is undefined = True')
  end

  it 'CDocBuilderContext | GetGlobal method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_context/get_global.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('If this paragraph is here, GetGlobal works')
  end

  # it 'CDocBuilderContext | IsError method' do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_context/is_error.py')
  #   expect('').to eq('')
  # end
end

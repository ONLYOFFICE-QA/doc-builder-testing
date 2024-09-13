# frozen_string_literal: true

require 'spec_helper'
describe 'CDocBuilderValue tests', :critical do
  it 'CDocBuilderValue | Call method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/call.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is Call method check')
  end

  it 'CDocBuilderValue | Clear method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/clear.py')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('before clear: False')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('after clear: True')
  end

  it 'CDocBuilderValue | Get method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/get.py')
    expect(docx.elements.first.nonempty_runs[4].text).to eq('Comment text is Comment one')
  end

  it 'CDocBuilderValue | GetLength method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/get_length.py')
    expect(docx.elements.first.nonempty_runs[8].text).to eq('Comments GetLength = 2')
  end

  it 'CDocBuilderValue | GetProperty / SetProperty method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/get_property.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Color is uniColor')
  end

  it 'CDocBuilderValue | IsArray method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_array.py')
    expect(docx.elements.first.nonempty_runs[4].text).to eq('Comments IsArray = True')
    expect(docx.elements.first.nonempty_runs[6].text).to eq('Comment IsArray = False')
  end

  it 'CDocBuilderValue | IsBool method' do
    skip 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=70046'
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_bool.py')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('Text IsBool = False')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Delete result IsBool = True')
  end

  it 'CDocBuilderValue | IsDouble method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_double.py')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('Width is double = True')
    expect(docx.elements.first.nonempty_runs[3].text).to eq('LockValue is double = False')
  end

  it 'CDocBuilderValue | IsEmpty method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_empty.py')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('Right call is empty = False')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Wrong call is empty = True')
  end

  it 'CDocBuilderValue | IsFunction method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_function.py')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('globalObj["Api"] is undefined = False')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('globalObj["Object"] is undefined = True')
  end

  it 'CDocBuilderValue | IsInt method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_int.py')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('Content is int = False')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('ElementsCount is int = True')
  end

  it 'CDocBuilderValue | IsNull method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_null.py')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('Text is null = False')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Style is null = True')
  end

  it 'CDocBuilderValue | IsObject method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_object.py')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('Paragraph is object = True')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('IsTrackRevisions is object = False')
  end

  it 'CDocBuilderValue | IsString method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_string.py')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('ClassType is string = True')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Charts is string = False')
  end

  it 'CDocBuilderValue | IsUndefined method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_undefined.py')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('Images[0] is undefined = False')
    expect(docx.elements.first.nonempty_runs[3].text).to eq('Images[1] is undefined = True')
  end

  it 'CDocBuilderValue | Set method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/set.py')
    expect(docx.elements[0].nonempty_runs[0].text).to eq('Set')
    expect(docx.elements[1].nonempty_runs[0].text).to eq('method test')
  end

  it 'CDocBuilderValue | ToBool method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/to_bool.py')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('IsTrackRevisions = False')
  end

  it 'CDocBuilderValue | ToDouble method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/to_double.py')
    expect(docx.elements.first.nonempty_runs[1].text).to eq('Width = 2160000.0')
  end

  it 'CDocBuilderValue | ToInt method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/to_int.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('ElementsCount = 1')
  end

  it 'CDocBuilderValue | ToString method' do
    docx = python_builder.build_and_parse('python/wrapper/smoke/doc_builder_value/to_string.py')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('GetText ToString = This is ToString method check')
  end
end

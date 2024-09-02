# frozen_string_literal: true

require_relative '../../spec_helper'
describe 'CDocBuilderValue tests', :critical do
  it 'CDocBuilderValue | Call method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/call.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('This is Call method check')
  end

  it 'CDocBuilderValue | Clear method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/clear.py')
    expect(docx.elements.first.nonempty_runs[0].text).to eq('before clear: False')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('after clear: True')
  end

  it 'CDocBuilderValue | Get method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/get.py')
    expect(docx.elements.first.nonempty_runs[4].text).to eq('Comment text is Comment one')
  end

  it 'CDocBuilderValue | GetLength method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/get_length.py')
    expect(docx.elements.first.nonempty_runs[8].text).to eq('Comments GetLength = 2')
  end

  it 'CDocBuilderValue | GetProperty / SetProperty method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/get_property.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Color is uniColor')
  end

  it 'CDocBuilderValue | IsArray method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_array.py')
    expect(docx.elements.first.nonempty_runs[4].text).to eq('Comments IsArray = True')
    expect(docx.elements.first.nonempty_runs[6].text).to eq('Comment IsArray = False')
  end

  it 'CDocBuilderValue | IsBool method' do
    skip 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=70046'
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_bool.py')
    expect(docx.elements.first.nonempty_runs[4].text).to eq('Text IsBool = False')
    expect(docx.elements.first.nonempty_runs[6].text).to eq('Delete result IsBool = True')

  end

  # it "CDocBuilderValue | IsDouble method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_double.py')
  #   expect('').to eq('')
  # end

  # it "CDocBuilderValue | IsEmpty method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_empty.py')
  #   expect('').to eq('')
  # end

  # it "CDocBuilderValue | IsFunction method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_function.py')
  #   expect('').to eq('')
  # end

  # it "CDocBuilderValue | IsInt method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_int.py')
  #   expect('').to eq('')
  # end

  # it "CDocBuilderValue | IsNull method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_null.py')
  #   expect('').to eq('')
  # end

  it 'CDocBuilderValue | IsObject method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_object.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Global API is object = True')
  end

  it 'CDocBuilderValue | IsString method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_string.py')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('GetText is string = True')
  end

  # it "CDocBuilderValue | IsUndefined method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/is_undefined.py')
  #   expect('').to eq('')
  # end

  it 'CDocBuilderValue | Set method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/set.py')
    expect(docx.elements[0].nonempty_runs[0].text).to eq('Set')
    expect(docx.elements[1].nonempty_runs[0].text).to eq('method test')
  end

  it 'CDocBuilderValue | ToBool method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/to_bool.py')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('Delete result = True')
  end

  # it "CDocBuilderValue | ToDouble method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/to_double.py')
  #   expect('').to eq('')
  # end

  # it "CDocBuilderValue | ToInt method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/to_int.py')
  #   expect('').to eq('')
  # end

  it 'CDocBuilderValue | ToString method' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder_value/to_string.py')
    expect(docx.elements.first.nonempty_runs[2].text).to eq('GetText ToString = This is ToString method check')
  end
end

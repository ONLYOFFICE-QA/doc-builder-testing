require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiDrawing sectin tests' do
  it 'GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetDistances method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setdistances.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetHorAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/sethoralign.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetHorPosition method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/sethorposition.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setsize.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetVerAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setveralign.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetVerPosition method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setverposition.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetWrappingStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setwrappingstyle.js')
    expect(docx.nil?).to eq(false)
  end
end

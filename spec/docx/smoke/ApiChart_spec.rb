require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiChart sectin tests' do
  it 'GetClassType method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiChart/getclasstype.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetHorAxisTitle method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiChart/sethoraxistitle.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetLegendPos method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiChart/setlegendpos.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetShowDataLabels method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiChart/setshowdatalabels.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTitle method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiChart/settitle.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetVerAxisTitle method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiChart/setveraxistitle.js')
      expect(docx.nil?).to eq(false)
  end

end
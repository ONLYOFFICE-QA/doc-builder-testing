require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'Api sectin tests' do
  it 'CreateBlipFill method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createblipfill.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateChart method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createchart.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateGradientStop method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/creategradientstop.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateImage method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createimage.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateLinearGradientFill method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createlineargradientfill.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateNoFill method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createnofill.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateParagraph method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createparagraph.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreatePatternFill method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createpatternfill.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreatePresetColor method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createpresetcolor.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateRadialGradientFill method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createradialgradientfill.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateRGBColor method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/creatergbcolor.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateRun method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createrun.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateSchemeColor method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createschemecolor.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateShape method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createshape.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateSolidFill method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createsolidfill.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateStroke method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createstroke.js')
      expect(docx.nil?).to eq(false)
  end

  it 'CreateTable method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createtable.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetDocument method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/getdocument.js')
      expect(docx.nil?).to eq(false)
  end

end
require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiTablePr sectin tests' do
  it 'GetClassType method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/getclasstype.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellSpacing method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setcellspacing.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetJc method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setjc.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetShd method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setshd.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetStyleColBandSize method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setstylecolbandsize.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetStyleRowBandSize method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setstylerowbandsize.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTableBorderBottom method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderbottom.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTableBorderInsideH method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderinsideh.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTableBorderInsideV method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderinsidev.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTableBorderLeft method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderleft.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTableBorderRight method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderright.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTableBorderTop method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablebordertop.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTableCellMarginBottom method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablecellmarginbottom.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTableCellMarginLeft method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablecellmarginleft.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTableCellMarginRight method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablecellmarginright.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTableCellMarginTop method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablecellmargintop.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTableInd method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableind.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTableLayout method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablelayout.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetWidth method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setwidth.js')
      expect(docx.nil?).to eq(false)
  end

end
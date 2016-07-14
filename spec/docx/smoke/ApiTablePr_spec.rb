require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiTablePr section tests' do
  it 'ApiTablePr | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetCellSpacing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setcellspacing.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetJc method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setjc.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setshd.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetStyleColBandSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setstylecolbandsize.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetStyleRowBandSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setstylerowbandsize.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetTableBorderBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderbottom.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetTableBorderInsideH method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderinsideh.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetTableBorderInsideV method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderinsidev.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetTableBorderLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderleft.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetTableBorderRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderright.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetTableBorderTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablebordertop.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetTableCellMarginBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablecellmarginbottom.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetTableCellMarginLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablecellmarginleft.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetTableCellMarginRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablecellmarginright.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetTableCellMarginTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablecellmargintop.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetTableInd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableind.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetTableLayout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablelayout.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTablePr | SetWidth method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setwidth.js')
    expect(docx.nil?).to eq(false)
  end
end

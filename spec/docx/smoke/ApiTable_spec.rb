require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiTable sectin tests' do
  it 'AddColumn method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/addcolumn.js')
    expect(docx.nil?).to eq(false)
  end

  it 'AddRow method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/addrow.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetRow method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/getrow.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetRowsCount method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/getrowscount.js')
    expect(docx.nil?).to eq(false)
  end

  it 'MergeCells method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/mergecells.js')
    expect(docx.nil?).to eq(false)
  end

  it 'RemoveColumn method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/removecolumn.js')
    expect(docx.nil?).to eq(false)
  end

  it 'RemoveRow method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/removerow.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetCellSpacing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setcellspacing.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetJc method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setjc.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setshd.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setstyle.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetStyleColBandSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setstylecolbandsize.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetStyleRowBandSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setstylerowbandsize.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTableBorderBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderbottom.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTableBorderInsideH method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderinsideh.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTableBorderInsideV method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderinsidev.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTableBorderLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderleft.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTableBorderRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderright.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTableBorderTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablebordertop.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTableCellMarginBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablecellmarginbottom.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTableCellMarginLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablecellmarginleft.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTableCellMarginRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablecellmarginright.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTableCellMarginTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablecellmargintop.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTableInd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableind.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTableLayout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablelayout.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTableLook method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablelook.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetWidth method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setwidth.js')
    expect(docx.nil?).to eq(false)
  end
end

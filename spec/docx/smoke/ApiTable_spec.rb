require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiTable section tests' do
  it 'ApiTable | ApiTable | AddColumn method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/addcolumn.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | AddRow method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/addrow.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | GetRow method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/getrow.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | GetRowsCount method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/getrowscount.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | MergeCells method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/mergecells.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | RemoveColumn method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/removecolumn.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | RemoveRow method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/removerow.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetCellSpacing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setcellspacing.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetJc method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setjc.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setshd.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setstyle.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetStyleColBandSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setstylecolbandsize.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetStyleRowBandSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setstylerowbandsize.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetTableBorderBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderbottom.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetTableBorderInsideH method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderinsideh.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetTableBorderInsideV method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderinsidev.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetTableBorderLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderleft.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetTableBorderRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderright.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetTableBorderTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablebordertop.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetTableCellMarginBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablecellmarginbottom.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetTableCellMarginLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablecellmarginleft.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetTableCellMarginRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablecellmarginright.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetTableCellMarginTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablecellmargintop.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetTableInd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableind.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetTableLayout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablelayout.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetTableLook method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablelook.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTable | ApiTable | SetWidth method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setwidth.js')
    expect(docx.nil?).to eq(false)
  end
end

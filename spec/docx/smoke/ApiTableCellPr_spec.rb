require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiTableCellPr sectin tests' do
  it 'GetClassType method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/getclasstype.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellBorderBottom method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellborderbottom.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellBorderLeft method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellborderleft.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellBorderRight method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellborderright.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellBorderTop method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellbordertop.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellMarginBottom method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellmarginbottom.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellMarginLeft method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellmarginleft.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellMarginRight method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellmarginright.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellMarginTop method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellmargintop.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetNoWrap method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setnowrap.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetShd method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setshd.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTextDirection method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/settextdirection.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetVerticalAlign method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setverticalalign.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetWidth method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setwidth.js')
      expect(docx.nil?).to eq(false)
  end

end
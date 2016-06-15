require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiTableCell sectin tests' do
  it 'GetClassType method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/getclasstype.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetContent method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/getcontent.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellBorderBottom method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellborderbottom.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellBorderLeft method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellborderleft.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellBorderRight method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellborderright.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellBorderTop method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellbordertop.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellMarginBottom method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellmarginbottom.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellMarginLeft method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellmarginleft.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellMarginRight method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellmarginright.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetCellMarginTop method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellmargintop.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetNoWrap method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setnowrap.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetShd method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setshd.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTextDirection method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/settextdirection.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetVerticalAlign method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setverticalalign.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetWidth method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setwidth.js')
      expect(docx.nil?).to eq(false)
  end

end
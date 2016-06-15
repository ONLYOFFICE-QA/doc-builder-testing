require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiTableCellPr section tests' do
  it 'ApiTableCellPr | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCellPr | SetCellBorderBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellborderbottom.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCellPr | SetCellBorderLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellborderleft.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCellPr | SetCellBorderRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellborderright.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCellPr | SetCellBorderTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellbordertop.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCellPr | SetCellMarginBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellmarginbottom.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCellPr | SetCellMarginLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellmarginleft.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCellPr | SetCellMarginRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellmarginright.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCellPr | SetCellMarginTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellmargintop.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCellPr | SetNoWrap method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setnowrap.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCellPr | SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setshd.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCellPr | SetTextDirection method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/settextdirection.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCellPr | SetVerticalAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setverticalalign.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCellPr | SetWidth method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setwidth.js')
    expect(docx.nil?).to eq(false)
  end
end

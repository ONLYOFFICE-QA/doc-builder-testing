require 'spec_helper'
describe 'ApiTableCell section tests' do
  it 'ApiTableCell | ApiTableCell | GetClassType method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCell | ApiTableCell | GetContent method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/getcontent.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellBorderBottom method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellborderbottom.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellBorderLeft method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellborderleft.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellBorderRight method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellborderright.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellBorderTop method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellbordertop.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellMarginBottom method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellmarginbottom.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellMarginLeft method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellmarginleft.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellMarginRight method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellmarginright.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCell | ApiTableCell | SetCellMarginTop method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellmargintop.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCell | ApiTableCell | SetNoWrap method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setnowrap.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCell | ApiTableCell | SetShd method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setshd.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCell | ApiTableCell | SetTextDirection method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/settextdirection.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCell | ApiTableCell | SetVerticalAlign method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setverticalalign.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiTableCell | ApiTableCell | SetWidth method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setwidth.js')
    expect(docx.nil?).to eq(false)
  end
end

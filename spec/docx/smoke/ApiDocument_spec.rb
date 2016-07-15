require 'spec_helper'
describe 'ApiDocument section tests' do
  it 'ApiDocument | AddElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/addelement.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | CreateNumbering method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/createnumbering.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | CreateSection method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/createsection.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | CreateStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/createstyle.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | GetDefaultParaPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getdefaultparapr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | GetDefaultStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getdefaultstyle.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | GetDefaultTextPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getdefaulttextpr.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | GetElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getelement.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | GetElementsCount method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getelementscount.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | GetFinalSection method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getfinalsection.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | GetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/getstyle.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | Push method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/push.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | RemoveAllElements method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/removeallelements.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | RemoveElement method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/removeelement.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDocument | SetEvenAndOddHdrFtr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDocument/setevenandoddhdrftr.js')
    expect(docx.nil?).to eq(false)
  end
end

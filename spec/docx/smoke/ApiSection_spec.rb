require 'spec_helper'
describe 'ApiSection section tests' do
  it 'ApiSection | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiSection | GetFooter method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/getfooter.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiSection | GetHeader method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/getheader.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiSection | RemoveFooter method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/removefooter.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiSection | RemoveHeader method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/removeheader.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiSection | SetEqualColumns method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setequalcolumns.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiSection | SetFooterDistance method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setfooterdistance.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiSection | SetHeaderDistance method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setheaderdistance.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiSection | SetNotEqualColumns method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setnotequalcolumns.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiSection | SetPageMargins method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setpagemargins.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiSection | SetPageSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setpagesize.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiSection | SetTitlePage method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/settitlepage.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiSection | SetType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/settype.js')
    expect(docx.nil?).to eq(false)
  end
end

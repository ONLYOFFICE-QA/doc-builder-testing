require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiSection sectin tests' do
  it 'GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetFooter method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/getfooter.js')
    expect(docx.nil?).to eq(false)
  end

  it 'GetHeader method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/getheader.js')
    expect(docx.nil?).to eq(false)
  end

  it 'RemoveFooter method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/removefooter.js')
    expect(docx.nil?).to eq(false)
  end

  it 'RemoveHeader method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/removeheader.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetEqualColumns method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setequalcolumns.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetFooterDistance method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setfooterdistance.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetHeaderDistance method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setheaderdistance.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetNotEqualColumns method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setnotequalcolumns.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetPageMargins method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setpagemargins.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetPageSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/setpagesize.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetTitlePage method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/settitlepage.js')
    expect(docx.nil?).to eq(false)
  end

  it 'SetType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiSection/settype.js')
    expect(docx.nil?).to eq(false)
  end
end

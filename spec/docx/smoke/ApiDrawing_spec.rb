require 'spec_helper'
describe 'ApiDrawing section tests' do
  it 'ApiDrawing | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/getclasstype.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDrawing | SetDistances method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setdistances.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDrawing | SetHorAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/sethoralign.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDrawing | SetHorPosition method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/sethorposition.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDrawing | SetSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setsize.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDrawing | SetVerAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setveralign.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDrawing | SetVerPosition method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setverposition.js')
    expect(docx.nil?).to eq(false)
  end

  it 'ApiDrawing | SetWrappingStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setwrappingstyle.js')
    expect(docx.nil?).to eq(false)
  end
end

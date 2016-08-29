require 'spec_helper'
describe 'ApiShape section tests' do
  it 'ApiShape | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiShape/getclasstype.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = shape')
  end

  it 'ApiShape | GetDocContent method' do
    pending 'Documentation error http://192.168.4.102/developers/document-builder/ApiShape/GetDocContent.aspx'
    expect('fixed?').to eq('true')
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiShape/getdoccontent.js')
    expect(docx.elements.first.nonempty_runs.size).to eq(1)
  end

  it 'ApiShape | SetVerticalTextAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiShape/setverticaltextalign.js')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.type).to eq(:shape)
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.text_body.elements[1].nonempty_runs.first.text).to eq('We removed all elements from the shape and added a new paragraph inside it, aligned top.')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.body_properties.anchor).to eq(:top)
  end
end

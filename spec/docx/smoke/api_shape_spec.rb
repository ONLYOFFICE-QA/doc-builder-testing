require 'spec_helper'
describe 'ApiShape section tests' do
  it 'ApiShape | GetClassType method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_shape/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = shape')
  end

  it 'ApiShape | GetDocContent method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_shape/get_doc_content.js')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.text_body.elements.first.character_style_array.size).to eq(1)
  end

  it 'ApiShape | SetVerticalTextAlign method' do
    docx = builder.build_and_parse('asserts/js/docx/smoke/api_shape/set_vertical_text_align.js')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.type).to eq(:shape)
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.text_body.elements[1].nonempty_runs.first.text).to eq('We removed all elements from the shape and added a new paragraph inside it, aligned top.')
    expect(docx.elements.first.nonempty_runs.first.alternate_content.office2010_content.graphic.data.body_properties.anchor).to eq(:top)
  end
end

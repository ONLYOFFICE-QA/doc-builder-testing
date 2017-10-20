require 'spec_helper'
describe 'ApiDrawing section tests' do
  it 'ApiDrawing | GetClassType method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_drawing/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class Type = shape')
  end

  it 'ApiDrawing | SetDistances method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_drawing/set_distances.js')
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.distance_from_text.bottom).to be_zero
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.distance_from_text.left).to eq(OoxmlParser::OoxmlSize.new(914_400, :emu))
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.distance_from_text.right).to eq(OoxmlParser::OoxmlSize.new(914_400, :emu))
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.distance_from_text.top).to be_zero
  end

  it 'ApiDrawing | SetHorAlign method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_drawing/set_hor_align.js')
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.horizontal_position.align).to eq(:center)
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.horizontal_position.relative_from).to eq(:page)
  end

  it 'ApiDrawing | SetHorPosition method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_drawing/set_hor_position.js')
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.horizontal_position.offset).to be_zero
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.horizontal_position.relative_from).to eq(:right_margin)
  end

  it 'ApiDrawing | SetSize method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_drawing/set_size.js')
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.object_size.x).to eq(OoxmlParser::OoxmlSize.new(1_828_800, :emu))
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.object_size.y).to eq(OoxmlParser::OoxmlSize.new(1_828_800, :emu))
  end

  it 'ApiDrawing | SetVerAlign method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_drawing/set_ver_align.js')
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.vertical_position.align).to eq(:top)
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.vertical_position.relative_from).to eq(:page)
  end

  it 'ApiDrawing | SetVerPosition method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_drawing/set_ver_position.js')
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.vertical_position.offset).to eq(OoxmlParser::OoxmlSize.new(914_400, :emu))
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.vertical_position.relative_from).to eq(:page)
  end

  it 'ApiDrawing | SetWrappingStyle method' do
    docx = builder.build_doc_and_parse('asserts/js/docx/smoke/api_drawing/set_wrapping_style.js')
    expect(docx.elements.first.nonempty_runs[3].alternate_content.office2010_content.properties.wrap.wrap_text).to eq(:square)
  end
end

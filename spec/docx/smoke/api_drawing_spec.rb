require 'spec_helper'
describe 'ApiDrawing section tests' do
  before :all do
    OoxmlParser.configure do |config|
      config.units = :emu
    end
  end
  it 'ApiDrawing | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/getclasstype.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Class Type = shape')
  end

  it 'ApiDrawing | SetDistances method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setdistances.js')
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.distance_from_text.bottom).to eq(0)
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.distance_from_text.left).to eq(914_400.0)
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.distance_from_text.right).to eq(914_400.0)
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.distance_from_text.top).to eq(0)
  end

  it 'ApiDrawing | SetHorAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/sethoralign.js')
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.horizontal_position.align).to eq(:center)
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.horizontal_position.relative_from).to eq(:page)
  end

  it 'ApiDrawing | SetHorPosition method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/sethorposition.js')
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.horizontal_position.offset).to eq(0)
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.horizontal_position.relative_from).to eq(:right_margin)
  end

  it 'ApiDrawing | SetSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setsize.js')
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.object_size.x).to eq(1_828_800.0)
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.object_size.y).to eq(1_828_800.0)
  end

  it 'ApiDrawing | SetVerAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setveralign.js')
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.vertical_position.align).to eq(:top)
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.vertical_position.relative_from).to eq(:page)
  end

  it 'ApiDrawing | SetVerPosition method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setverposition.js')
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.vertical_position.offset).to eq(914_400)
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.vertical_position.relative_from).to eq(:page)
  end

  it 'ApiDrawing | SetWrappingStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiDrawing/setwrappingstyle.js')
    expect(docx.elements.first.character_style_array[4].alternate_content.office2010_content.properties.wrap.wrap_text).to eq(:square)
  end
end

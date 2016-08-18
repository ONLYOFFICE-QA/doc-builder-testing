require 'spec_helper'
describe 'All formats tests' do
  before :all do
    OoxmlParser.configure do |config|
       config.units = :emu
     end
 end

  describe 'Docx' do
    it 'All formats | docx' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/Api/createblipfill.js')
      expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.type).to eq(:shape)
      expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.preset_geometry.name).to eq(:star10)
      expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.type).to eq(:picture)
      expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.fill_color.value.nil?).to be_falsey
      expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.shape_size.extent.x).to eq(5_930_900.0)
      expect(docx.elements.first.character_style_array[1].alternate_content.office2010_content.graphic.data.properties.shape_size.extent.y).to eq(595_605.0)
    end
  end
end
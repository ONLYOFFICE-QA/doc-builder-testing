require 'spec_helper'
describe 'ApiBullet section tests' do
  it 'ApiBullet | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_bullet/get_class_type.js')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.numbering.start_at).to eq('1')
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs.first.properties.numbering.type).to eq(:arabicParenR)
    expect(xlsx.worksheets.first.drawings.first.shape.text_body.paragraphs[2].runs.first.text).to eq('Class Type = bullet')
  end
end

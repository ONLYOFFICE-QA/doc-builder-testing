require 'spec_helper'
describe 'ApiBullet section tests' do
  it 'ApiBullet | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_bullet/get_class_type.js')
    expect(xlsx).to be_with_data
  end
end

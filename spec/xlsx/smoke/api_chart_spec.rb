require 'spec_helper'
describe 'ApiChart section tests' do
  it 'ApiChart | GetClassType method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api_color/get_color_type.js')
    expect(xlsx.worksheets.first.rows[1].cells[0].text).to eq('Text with color')
    expect(xlsx.worksheets.first.rows[3].cells[0].text).to eq('Class type = color')
  end
end

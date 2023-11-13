require 'spec_helper'


describe 'ApiRGBColor section tests' do
  it 'ApiRGBColor | ToJSON method' do
    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/get_class_type.js')
    expected_text = 'Class Type = rgbcolor'
    actual_text = docx.elements[1].nonempty_runs.first.text
    expect(actual_text.downcase).to eq(expected_text.downcase)

    json_text = docx.elements[0].nonempty_runs.last.text.strip
    expect { JSON.parse(json_text) }.not_to raise_error do |error|
      expect(error).to be_a(JSON::ParserError)
    end

    json = JSON.parse(json_text)
    expect(json['graphic']['spPr']['fill']['fill']['gsLst'][1]['color']['color']['rgba']).to eq([255, 111, 61])
  end


end


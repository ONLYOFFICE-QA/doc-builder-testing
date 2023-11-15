# frozen_string_literal: true

require 'spec_helper'

describe 'ApiRGBColor section tests' do
  it 'ApiRGBColor | GetClassType method' do

    docx = builder.build_and_parse('js/docx/smoke/api_rgb_color/get_class_type.js')


    actual_class_type = docx.elements[1].nonempty_runs[0].text.downcase.gsub(' ', '').gsub('=', '')


    class_type_prefix = 'class type = '
    actual_class_type = docx.elements[1].nonempty_runs[0].text.downcase
    actual_class_type.slice!(class_type_prefix) if actual_class_type.start_with?(class_type_prefix)


    expected_class_type = 'rgbcolor'
    expect(actual_class_type).to eq(expected_class_type)


    json_text = docx.elements[0].nonempty_runs.last.text.strip

    if json_text.start_with?('{')
      begin
        json = JSON.parse(json_text)
        color_from_json = json['graphic']['spPr']['fill']['fill']['gsLst'][1]['color']['color']['rgba']


        expected_color = [255, 164, 101]

        expect(color_from_json).to eq(expected_color)
      rescue JSON::ParserError => e
        puts "Error parsing JSON: #{e.message}"
      end
    else
      puts 'Invalid JSON format'
    end
  end
end



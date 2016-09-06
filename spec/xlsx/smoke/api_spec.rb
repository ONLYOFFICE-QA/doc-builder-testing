require 'spec_helper'
describe 'Api section tests' do
  it 'Api | CreateBlipFill method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_blip_fill.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | CreateBullet method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_bullet.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | CreateGradientStop method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_gradient_stop.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | CreateLinearGradientFill method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_linear_gradient_fill.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | CreateNoFill method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_no_fill.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | CreateNumbering method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_numbering.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | CreateParagraph method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_paragraph.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | CreatePatternFill method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_pattern_fill.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | CreatePresetColor method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_preset_color.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | CreateRadialGradientFill method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_radial_gradient_fill.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | CreateRgbColor method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_rgb_color.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | CreateRun method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_run.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | CreateSchemeColor method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_scheme_color.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | CreateSolidFill method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_solid_fill.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | CreateStroke method' do
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/create_stroke.js')
    expect(xlsx).to be_with_data
  end

  it 'Api | GetActiveSheet method' do
    pending 'Not a complete example'
    xlsx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/xlsx/smoke/api/get_active_sheet.js')
    expect(xlsx).to be_with_data
  end
end

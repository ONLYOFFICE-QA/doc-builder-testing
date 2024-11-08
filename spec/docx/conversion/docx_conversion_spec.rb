# frozen_string_literal: true

require 'spec_helper'
describe 'Conversion tests from docx' do
  it 'Conversion | docx to docx', critical: true do
    parsed_output_file = builder.build_and_parse('js/conversion/docx/docx_to_docx.js')
    expect(parsed_output_file).to be_with_data
  end

  it 'Conversion | docx to docxf' do
    parsed_output_file = builder.build_and_parse('js/conversion/docx/docx_to_docxf.js')
    ext = builder.recognize_output_format(File.read('js/conversion/docx/docx_to_docxf.js'))
    expect(File.extname(parsed_output_file.file_path).strip.downcase[1..]).to eq(ext)
    expect(parsed_output_file).to be_with_data
  end

  it 'Conversion | docx to docm' do
    parsed_output_file = builder.build_and_parse('js/conversion/docx/docx_to_docm.js')
    ext = builder.recognize_output_format(File.read('js/conversion/docx/docx_to_docm.js'))
    expect(File.extname(parsed_output_file.file_path).strip.downcase[1..]).to eq(ext)
    expect(parsed_output_file).to be_with_data
  end

  it 'Conversion | docx to dotx' do
    parsed_output_file = builder.build_and_parse('js/conversion/docx/docx_to_dotx.js')
    ext = builder.recognize_output_format(File.read('js/conversion/docx/docx_to_dotx.js'))
    expect(File.extname(parsed_output_file.file_path).strip.downcase[1..]).to eq(ext)
    expect(parsed_output_file).to be_with_data
  end

  it 'Conversion | docx to dotm' do
    parsed_output_file = builder.build_and_parse('js/conversion/docx/docx_to_dotm.js')
    ext = builder.recognize_output_format(File.read('js/conversion/docx/docx_to_dotm.js'))
    expect(File.extname(parsed_output_file.file_path).strip.downcase[1..]).to eq(ext)
    expect(parsed_output_file).to be_with_data
  end

  it 'Conversion | docx to pdf', critical: true do
    parsed_output_file = builder.build_and_parse('js/conversion/docx/docx_to_pdf.js')
    ext = builder.recognize_output_format(File.read('js/conversion/docx/docx_to_pdf.js'))
    expect(File.extname(parsed_output_file.file_path).strip.downcase[1..]).to eq(ext)
    expect(parsed_output_file.pages[0][:text]).to eq('This is just a sample text. Nothing special.')
  end

  it 'Conversion | docx to epub', bug: true do
    output_file = builder.build_file('js/conversion/docx/docx_to_epub.js')
    ext = builder.recognize_output_format(File.read('js/conversion/docx/docx_to_epub.js'))
    expect(File.extname(output_file).strip.downcase[1..]).to eq(ext)
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'Conversion | docx to fb2', bug: true do
    output_file = builder.build_file('js/conversion/docx/docx_to_fb2.js')
    ext = builder.recognize_output_format(File.read('js/conversion/docx/docx_to_fb2.js'))
    expect(File.extname(output_file).strip.downcase[1..]).to eq(ext)
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'Conversion | docx to html', bug: true do
    output_file = builder.build_file('js/conversion/docx/docx_to_html.js')
    ext = builder.recognize_output_format(File.read('js/conversion/docx/docx_to_html.js'))
    expect(File.extname(output_file).strip.downcase[1..]).to eq(ext)
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'Conversion | docx to ott', bug: true do
    output_file = builder.build_file('js/conversion/docx/docx_to_ott.js')
    ext = builder.recognize_output_format(File.read('js/conversion/docx/docx_to_ott.js'))
    expect(File.extname(output_file).strip.downcase[1..]).to eq(ext)
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'Conversion | docx to odt' do
    output_file = builder.build_file('js/conversion/docx/docx_to_odt.js')
    ext = builder.recognize_output_format(File.read('js/conversion/docx/docx_to_odt.js'))
    expect(File.extname(output_file).strip.downcase[1..]).to eq(ext)
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'Conversion | docx to pdfa', bug: true do
    output_file = builder.build_file('js/conversion/docx/docx_to_pdfa.js')
    ext = builder.recognize_output_format(File.read('js/conversion/docx/docx_to_pdfa.js'))
    expect(File.extname(output_file).strip.downcase[1..]).to eq(ext)
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'Conversion | docx to rtf', critical: true do
    output_file = builder.build_file('js/conversion/docx/docx_to_rtf.js')
    ext = builder.recognize_output_format(File.read('js/conversion/docx/docx_to_rtf.js'))
    expect(File.extname(output_file).strip.downcase[1..]).to eq(ext)
    expect(builder).not_to be_file_empty(output_file)
  end

  it 'Conversion | Docx to Txt', critical: true do
    output_file = builder.build_file('js/conversion/docx/docx_to_txt.js')
    ext = builder.recognize_output_format(File.read('js/conversion/docx/docx_to_txt.js'))
    expect(File.extname(output_file).strip.downcase[1..]).to eq(ext)
    expect(builder).not_to be_file_empty(output_file)
  end
end

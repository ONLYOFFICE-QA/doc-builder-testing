# frozen_string_literal: true

require_relative '../../spec_helper'
describe 'CDocBuilder tests', :critical do
  # it "CDocBuilder | CreateFile method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/base_example.py')
  # end

  it "CDocBuilder | OpenFile method" do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/open_file.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('It’s-a me, Mario!')
  end

  # it "CDocBuilder | SaveFile method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/base_example.py')
  # end

  # it "CDocBuilder | CloseFile method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/base_example.py')
  # end

  # it "CDocBuilder | Initialize method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/base_example.py')
  # end

  # it "CDocBuilder | Dispose method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/base_example.py')
  # end

  # it "CDocBuilder | IsSaveWithDoctrendererMode method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/base_example.py')
  # end

  # it "CDocBuilder | SetTmpFolder method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/base_example.py')
  # end

  it "CDocBuilder | ExecuteCommand method" do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/execute_command.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Some ExecuteCommand value')
  end

  # it "CDocBuilder | GetContext method" do
  #   docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/base_example.py')
  #   expect().to eq()
  # end

  it "CDocBuilder | GetVersion method" do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/get_version.py')
    expect(docx.elements.first.nonempty_runs.first.text).not_to eq('')
  end

  it "CDocBuilder | Run method" do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/run.py')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('This is a paragraph for Run')
  end

  it "CDocBuilder | RunText method" do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/run_text.py')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('This is a paragraph for RunText')
  end

  it "CDocBuilder | SetProperty method" do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/set_property.py')
    expect(docx.elements.first.nonempty_runs.first.text).not_to eq('')
  end

  # it "CDocBuilder | WriteData method" do
  #   script_file = 'python/wrapper/smoke/doc_builder/write_data.py'
  #   script_file_content = File.read(script_file)
  #   temp_output_file = Tempfile.new([File.basename(script_file), ".log"])
  #   output_path = temp_output_file.path
  #   script_file_content.gsub!('WriteData.log', "#{output_path}")
  #   temp_output_file.close!
  #   temp_script_file = Tempfile.new([File.basename(script_file), File.extname(script_file)])
  #   temp_script_file.write(script_file_content)
  #   temp_script_file.close
  #   builder.build('tmp/write_data.py20240902-114437-ks391u.py')
  #   File.exist?output_path
  # end

  it 'CDocBuilder | Base script example' do
    docx = builder.build_and_parse('python/wrapper/smoke/doc_builder/base_example.py')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Hello, World!')
  end
end

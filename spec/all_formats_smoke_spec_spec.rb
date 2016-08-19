require 'spec_helper'
describe 'All formats tests' do

  it 'All formats | Docx' do
    docx = DocBuilderWrapper.new.build_doc_and_parse("asserts/js/other_formats/addtext_docx.js")
    expect(docx).to be_with_data
  end

  it 'All formats | Xlsx' do
    docx = DocBuilderWrapper.new.build_doc_and_parse("asserts/js/other_formats/addtext_xlsx.js")
    expect(docx).to be_with_data
  end


  %w(odt rtf pdf txt).each do |current_format|
    it "All formats | #{current_format}" do
      output_file = DocBuilderWrapper.new.build_doc_without_parse("asserts/js/other_formats/addtext_#{current_format}.js")
      expect(DocBuilderWrapper.new.file_empty?(output_file)).to be_falsey
    end
  end
end
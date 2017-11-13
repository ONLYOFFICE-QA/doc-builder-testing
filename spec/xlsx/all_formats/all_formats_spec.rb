require 'spec_helper'
describe 'From Xlsx' do
  it 'All formats | From Xlsx to Xlsx' do
    xlsx = builder.build_doc_and_parse('asserts/js/other_formats/addtext_xlsx.js')
    expect(xlsx).to be_with_data
  end

  it 'All formats | From Xlsx to Ods' do
    output_file = builder.build_doc_without_parse('asserts/js/other_formats/addtext_ods.js')
    expect(builder.file_empty?(output_file)).to be_falsey
  end

  it 'All formats | From Xlsx to Pdf' do
    pending 'http://bugzilla.onlyoffice.com/show_bug.cgi?id=36084' if ENV['BUILDER_PLATFORM'] == 'WEB'
    output_file = builder.build_doc_without_parse('asserts/js/other_formats/addtext_pdf_from_xlsx.js')
    expect(builder.file_empty?(output_file)).to be_falsey
  end

  it 'All formats | From Xlsx to Csv' do
    output_file = builder.build_doc_without_parse('asserts/js/other_formats/addtext_csv.js')
    expect(builder.file_empty?(output_file)).to be_falsey
  end
end

require 'spec_helper'
describe 'Other results' do
  it 'Correct error for builder.CloseFile();' do
    if ENV['BUILDER_PLATFORM'] == 'WEB'
      expect { builder.build_and_parse('spec/other/close_file.js') }.to raise_error(EmptyUrlsInWebBuilderResponse)
    else
      expect { builder.build_and_parse('spec/other/close_file.js') }.to raise_error
    end
  end
end

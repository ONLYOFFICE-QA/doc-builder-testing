# frozen_string_literal: true

require 'spec_helper'
describe 'Other results' do
  it 'Correct error for builder.CloseFile();' do
    if web_builder?
      expect { builder.build_and_parse('js/other/close_file.js') }.to raise_error(EmptyUrlsInWebBuilderResponse)
    else
      expect { builder.build_and_parse('js/other/close_file.js') }.to raise_error(DocBuilderFileCreationError)
    end
  end
end

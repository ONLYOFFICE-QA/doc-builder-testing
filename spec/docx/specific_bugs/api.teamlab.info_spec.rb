# frozen_string_literal: true

require 'spec_helper'

describe 'api.teamlab.info scripts' do
  it 'https://api.teamlab.info/officeapi/buildersamples/createbasicform' do
    file = builder.build_and_parse('js/api_teamlab_info/createbasicform.js')
    expect(file.elements[1]).not_to be_nil
    expect(File.size(file.file_path)).to be > 10_000
  end
end

require 'spec_helper'

describe 'DocumentBuilder version' do
  it 'showing version should not raise any error' do
    skip if ENV['BUILDER_PLATFORM'] == 'WEB'
    expect { builder.version }.not_to output.to_stderr_from_any_process
  end
end

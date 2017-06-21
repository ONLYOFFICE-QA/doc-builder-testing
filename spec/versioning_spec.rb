require 'spec_helper'

describe 'DocumentBuilder version' do
  let(:builder) { DocBuilderWrapper.new }

  it 'showing version should not raise any error' do
    expect { builder.version }.not_to output.to_stderr_from_any_process
  end
end

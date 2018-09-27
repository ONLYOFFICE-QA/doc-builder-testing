require 'spec_helper'

describe 'DocumentBuilder version' do
  it 'showing version should not raise any error' do
    expect { builder.version }.not_to output.to_stderr_from_any_process
  end

  it 'ability to parse semantic version of product' do
    expect(builder.semver).to be_a(Semantic::Version)
  end

  it 'version should show some x2t version' do
    pending('http://bugzilla.onlyoffice.com/show_bug.cgi?id=36793')
    expect(builder.version).to include('x2t')
  end
end

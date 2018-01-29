require 'spec_helper'

describe 'DocumentBuilder version' do
  it 'showing version should not raise any error' do
    skip if ENV['BUILDER_PLATFORM'] == 'WEB'
    expect { builder.version }.not_to output.to_stderr_from_any_process
  end

  it 'ability to parse semantic version of product' do
    skip if ENV['BUILDER_PLATFORM'] == 'WEB'
    expect(builder.semver).to be_a(Semantic::Version)
  end

  it 'version should show some x2t version' do
    skip if ENV['BUILDER_PLATFORM'] == 'WEB'
    pending('http://bugzilla.onlyoffice.com/show_bug.cgi?id=36793')
    expect(builder.version).to include('x2t')
  end
end

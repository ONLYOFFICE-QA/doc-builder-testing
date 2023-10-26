# frozen_string_literal: true

require 'spec_helper'

describe 'DocumentBuilder version', :win do
  it 'showing version should not raise any error' do
    expect { builder.version }.not_to output.to_stderr_from_any_process
  end

  it 'ability to parse semantic version of product' do
    expect(builder.semver).to be_a(Semantic::Version)
  end

  it 'version should not show x2t version' do
    expect(builder.version).not_to include('x2t')
  end
end

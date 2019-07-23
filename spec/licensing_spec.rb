# frozen_string_literal: true

require 'spec_helper'

describe 'DocumentBuilder licensing' do
  it 'running docbuilder create temp license' do
    skip if ENV['BUILDER_PLATFORM'] == 'WEB'
    skip('License terms are too different for different versions')
    expect(Dir["#{builder.license_path}/*.lickey"].length).to eq(1)
  end
end

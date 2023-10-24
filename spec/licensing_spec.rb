# frozen_string_literal: true

require 'spec_helper'

describe 'DocumentBuilder licensing', :win do
  it 'running docbuilder will not create temp license' do
    skip('This test only for Desktop Builder') if web_builder?
    expect(Dir["#{builder.license_path}/*.lickey"]).to be_empty
  end
end

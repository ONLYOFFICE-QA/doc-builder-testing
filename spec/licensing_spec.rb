require 'spec_helper'

describe 'DocumentBuilder licensing' do
  it 'running docbuilder create temp license' do
    skip if ENV['BUILDER_PLATFORM'] == 'WEB'
    pending('Builder from develop lost license') if builder.semver == Semantic::Version.new('0.0.0')
    expect(Dir["#{builder.license_path}/*.lickey"].length).to eq(1)
  end
end

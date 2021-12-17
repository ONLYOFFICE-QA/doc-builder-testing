# frozen_string_literal: true

require 'spec_helper'

describe DocBuilderWrapper, '#exe_path' do
  it 'by default exe path is default' do
    expect(described_class.new.builder_exe).to eq(described_class.new.default_builder_location)
  end

  it 'default exe path can be changed by ENV' do
    fake_exe_path = '/tmp/builder_exe'
    ENV['BUILDER_EXE_PATH'] = fake_exe_path
    expect(described_class.new.builder_exe).to eq(fake_exe_path)
  end
end

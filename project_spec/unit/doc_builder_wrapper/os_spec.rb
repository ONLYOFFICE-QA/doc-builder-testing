# frozen_string_literal: true

require_relative '../../spec_helper'

describe 'OS' do
  it 'checks if OS is defined and is a module' do
    expect(Object.const_defined?(:OS)).to be(true)
    expect(Object.const_get(:OS)).to be_a(Module)
    expect(OS.windows?).to be(true).or be(false)
    expect(OS.mac?).to be(true).or be(false)
    expect(OS.unix?).to be(true).or be(false)
    expect(OS.jruby?).to be(true).or be(false)
    expect(OS.rocky_linux?).to be(true).or be(false)
  end
end

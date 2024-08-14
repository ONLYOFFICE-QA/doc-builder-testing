# frozen_string_literal: true

require_relative '../../spec_helper'

describe MethodMatcher do
  let(:path) { "#{Dir.pwd}/assets/unit" }

  it 'true when found' do
    matcher = described_class.new('Method', path).pattern_found?
    expect(matcher).to be_truthy
  end

  it 'false when not found' do
    matcher = described_class.new('abracadabra', path).pattern_found?
    expect(matcher).to be_falsey
  end
end

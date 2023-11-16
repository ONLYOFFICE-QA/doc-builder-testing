# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/coverage/test_coverage'

describe TestCoverage do
  let(:json) { described_class.get_api }
  let(:redactors) { described_class.redactors }
  let(:result_json) { described_class.run(json) }

  it 'json that should have expected fields' do
    hash = JSON.parse(json)
    expect(hash).to be_an(Hash)
    expect(hash.length).to eq(4)
    hash.each do |key, _value|
      expect(redactors.key(key)).to be_truthy
    end
  end

  it 'run result should be json [String] with expected fields' do
    hash = JSON.parse(result_json)
    expect(hash).to be_an(Hash)
    expect(hash.length).to eq(4)
    hash.each do |key, _value|
      expect(redactors.key(key)).to be_truthy
    end
  end

  describe described_class::Matcher do
    let(:path) { File.join(Dir.pwd, 'assets', 'unit') }

    it 'true when found' do
      matcher = described_class.new('Pattern', path)
      expect(matcher).to be_pattern_found
    end

    it 'false when not found' do
      matcher = described_class.new('abracadabra', path)
      expect(matcher).not_to be_pattern_found
    end
  end
end

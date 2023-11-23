# frozen_string_literal: true

require_relative '../spec_helper'

describe TestCoverageResult do
  let(:bad) { 'https://raw.githubusercontent.com/ONLYOFFICE-QA' }

  it 'aborted if bad address' do
    expect { described_class.new(address: bad) }
      .to raise_error.with_message(/Failed to download the file. HTTP status code: .*/)
  end

  describe TestCoverageResult do
    let(:instance) { described_class.new }
    let(:json) { instance.api_list }
    let(:result_json) { instance.run }
    let(:editors) { described_class::EDITORS }

    it 'json that should have expected fields' do
      hash = JSON.parse(json)
      expect(hash).to be_an(Hash)
      expect(hash.length).to eq(4)
      hash.each do |key, _value|
        expect(editors.key(key)).to be_truthy
      end
    end

    it 'run result should be json [String] with expected fields' do
      hash = JSON.parse(result_json)
      expect(hash).to be_an(Hash)
      expect(hash.length).to eq(4)
      hash.each do |key, _value|
        expect(editors.key(key)).to be_truthy
      end
    end
  end
end

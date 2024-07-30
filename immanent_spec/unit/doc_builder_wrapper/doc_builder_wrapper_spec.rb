# frozen_string_literal: true

require_relative '../../spec_helper'

describe DocBuilderWrapper do
  let(:builder) { described_class.new }

  describe 'get_argument_string method' do
    it 'check gsub( ", \" )' do
      expect(builder.get_argument_string('""')).to eq('\"\"')
    end

    it 'check sub( ^{, \{ )' do
      expect(builder.get_argument_string('{{')).to eq('\{{')
    end

    it 'check sub( }$, \} )' do
      expect(builder.get_argument_string('}}')).to eq('}\}')
    end

    it 'check full' do
      expect(builder.get_argument_string({ hash: { key: 'value' } }.to_json)).to eq('\{\"hash\":{\"key\":\"value\"}\}')
    end
  end
end

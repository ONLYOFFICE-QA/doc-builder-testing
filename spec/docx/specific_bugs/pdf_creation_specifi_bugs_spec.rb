# frozen_string_literal: true

require 'spec_helper'

describe 'PDF Creation specific bugs' do
  it 'Bug 48473' do
    # TODO: replace link after fix
    file = builder.build_and_parse('js/pdf/bug_48473.js')
    expect(File.size(file.file_path)).to be > 10_000
  end
end

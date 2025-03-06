# frozen_string_literal: true

require 'spec_helper'
describe 'ApiRange regression tests' do
  it 'ApiRange | 71120 IntersectWith method' do
    skip('https://bugzilla.onlyoffice.com/show_bug.cgi?id=71590') if builder.semver < Semantic::Version.new('8.3.0')
    skip('Test require local file to open and not available in web builder') if web_builder?
    docx = builder.build_and_parse('js/docx/regression/api_range/71120_intersect_with.js')
    expect(docx.elements[2].nonempty_runs[0].text).to eq("Another text\rStill text\r")
    expect(docx.elements[2].nonempty_runs[2].text).to eq("One more text\r")
    expect(docx.elements[2].nonempty_runs[4].text).to eq('IntersectWith result = null')
  end
end

# frozen_string_literal: true

require 'spec_helper'
describe 'ApiComment section tests' do
  # it 'ApiComment | AddReply method' do
  #   docx = builder.build_and_parse('js/docx/smoke/api_comment/add_reply.js')
  #   expect('').to eq('')
  # end

  # it 'ApiComment | Delete method' do
  #   docx = builder.build_and_parse('js/docx/smoke/api_comment/delete.js')
  #   expect('').to eq('')
  # end

  it 'ApiComment | GetAuthorName method' do
    docx = builder.build_and_parse('js/docx/smoke/api_comment/get_author_name.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Author name: John Smith')
  end

  it 'ApiComment | GetClassType method' do
    docx = builder.build_and_parse('js/docx/smoke/api_comment/get_class_type.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Class type: comment')
  end

  it 'ApiComment | GetId method' do
    docx = builder.build_and_parse('js/docx/smoke/api_comment/get_id.js')
    comment_id = docx.elements[1].nonempty_runs.first.text[/\d+/]
    expect(comment_id).not_to be_nil
  end

  it 'ApiComment | GetQuoteText method' do
    docx = builder.build_and_parse('js/docx/smoke/api_comment/get_quote_text.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Quote text: This is just GetQuoteText method test')
  end

  it 'ApiComment | GetRepliesCount method' do
    docx = builder.build_and_parse('js/docx/smoke/api_comment/get_replies_count.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Comment replies: 2')
  end

  it 'ApiComment | GetReply method' do
    docx = builder.build_and_parse('js/docx/smoke/api_comment/get_reply.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('First reply: Yet another reply')
  end

  it 'ApiComment | GetText method' do
    docx = builder.build_and_parse('js/docx/smoke/api_comment/get_text.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Comment: comment text')
  end

  # it 'ApiComment | SetTime\GetTime method' do
  #   docx = builder.build_and_parse('js/docx/smoke/api_comment/set_get_time.js')
  #   expect('').to eq('')
  # end

  # it 'ApiComment | SetTimeUTC\GetTimeUTC method' do
  #   docx = builder.build_and_parse('js/docx/smoke/api_comment/set_get_time_utc.js')
  #   expect('').to eq('')
  # end

  it 'ApiComment | GetUserId method' do
    docx = builder.build_and_parse('js/docx/smoke/api_comment/get_user_id.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('User ID: uid-1')
  end

  it 'ApiComment | IsSolved method' do
    docx = builder.build_and_parse('js/docx/smoke/api_comment/is_solved.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Is solved: false')
  end

  # it 'ApiComment | RemoveReplies method' do
  #   docx = builder.build_and_parse('js/docx/smoke/api_comment/remove_replies.js')
  #   expect('').to eq('')
  # end

  it 'ApiComment | SetAuthorName method' do
    docx = builder.build_and_parse('js/docx/smoke/api_comment/set_author_name.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Author name: Mark Potato')
  end

  it 'ApiComment | SetSolved method' do
    docx = builder.build_and_parse('js/docx/smoke/api_comment/set_solved.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Is solved: true')
    expect(docx.elements[2].nonempty_runs.first.text).to eq('Is solved: false')
  end

  it 'ApiComment | SetText method' do
    docx = builder.build_and_parse('js/docx/smoke/api_comment/set_text.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('Comment: new text')
  end

  it 'ApiComment | SetUserId method' do
    docx = builder.build_and_parse('js/docx/smoke/api_comment/set_user_id.js')
    expect(docx.elements[1].nonempty_runs.first.text).to eq('User ID: uid-2')
  end
end

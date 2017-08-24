require 'spec_helper'

describe 'Check Column' do
  it '[text] One Column' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/columns/add_one_column.js')
    expect(docx.page_properties.columns.count).to eq(1)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.elements[1].nonempty_runs.first.text).to eq('First columns')
  end

  it '[text] Two columns' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/columns/add_two_columns.js')
    expect(docx.page_properties.columns.count).to eq(2)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.elements[1].nonempty_runs.first.text).to eq('First columns')
    expect(docx.elements[2].nonempty_runs.first.text).to eq('Second columns')
  end

  it '[text] Three columns' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/columns/add_three_columns.js')
    expect(docx.page_properties.columns.count).to eq(3)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.elements[1].nonempty_runs.first.text).to eq('First columns')
    expect(docx.elements[2].nonempty_runs.first.text).to eq('Second columns')
    expect(docx.elements[3].nonempty_runs.first.text).to eq('Third columns')
  end

  it '[Table] One Column' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/columns/add_table_in_one_column.js')
    expect(docx.page_properties.columns.count).to eq(1)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.element_by_description(location: :canvas, type: :paragraph)[1].rows.length).to eq(3)
    expect(docx.element_by_description(location: :canvas, type: :paragraph)[1].rows[0].cells.length).to eq(3)
  end

  it '[Table] Two columns' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/columns/add_table_in_two_column.js')
    expect(docx.page_properties.columns.count).to eq(2)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.element_by_description[1].rows.length).to eq(3)
    expect(docx.element_by_description[1].rows[0].cells.length).to eq(3)
    expect(docx.element_by_description[4].rows.length).to eq(3)
    expect(docx.element_by_description[4].rows[0].cells.length).to eq(3)
  end

  it '[text] Three columns' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/columns/add_table_in_three_columns.js')
    expect(docx.page_properties.columns.count).to eq(3)
    expect(docx.page_properties.columns.equal_width).to be_truthy
    expect(docx.element_by_description[1].rows.length).to eq(3)
    expect(docx.element_by_description[1].rows[0].cells.length).to eq(3)
    expect(docx.element_by_description[4].rows.length).to eq(3)
    expect(docx.element_by_description[4].rows[0].cells.length).to eq(3)
    expect(docx.element_by_description[7].rows.length).to eq(3)
    expect(docx.element_by_description[7].rows[0].cells.length).to eq(3)
  end
end

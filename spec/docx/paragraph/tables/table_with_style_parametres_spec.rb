require 'spec_helper'

describe 'Add table with style parametres' do
  it 'Table with parametres: false, false, true, true, false, true' do
    docx = builder.build_and_parse('asserts/js/docx/paragraph/tables/table_with_styleparametres.js')
    expect(docx.elements[1].rows.length).to eq(3)
    expect(docx.elements[1].properties.table_look.banding_column).to be_falsey
    expect(docx.elements[1].properties.table_look.banding_row).to be_falsey
    expect(docx.elements[1].properties.table_look.first_column).to be_falsey
    expect(docx.elements[1].properties.table_look.first_row).to be_falsey
    expect(docx.elements[1].properties.table_look.last_column).to be_truthy
    expect(docx.elements[1].properties.table_look.last_row).to be_truthy
    expect(docx.elements[1].properties.table_look.no_horizontal_banding).to be_truthy
    expect(docx.elements[1].properties.table_look.no_vertical_banding).to be_falsey
  end
end

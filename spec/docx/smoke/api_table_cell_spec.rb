require 'spec_helper'
describe 'ApiTableCell section tests' do
  it 'ApiTableCell | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/getclasstype.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('Class Type = tableCell')
  end

  it 'ApiTableCell | GetContent method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/getcontent.js')
    expect(docx.elements[1].rows.first.cells.first.elements.first.character_style_array[1].text).to eq('Cell #1')
  end

  it 'ApiTableCell | SetCellBorderBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellborderbottom.js')
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.bottom.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.bottom.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.bottom.val).to eq(:single)
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.bottom.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
  end

  it 'ApiTableCell | SetCellBorderLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellborderleft.js')
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.left.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.left.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.left.val).to eq(:single)
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.left.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
  end

  it 'ApiTableCell | SetCellBorderRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellborderright.js')
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.right.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.right.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.right.val).to eq(:single)
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.right.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
  end

  it 'ApiTableCell | SetCellBorderTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellbordertop.js')
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.top.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.top.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.top.val).to eq(:single)
    expect(docx.elements[1].rows.first.cells.first.properties.borders_properties.top.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
  end

  it 'ApiTableCell | SetCellMarginBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellmarginbottom.js')
    expect(docx.elements[1].rows.first.cells.first.properties.table_cell_margin.bottom).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableCell | SetCellMarginLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellmarginleft.js')
    expect(docx.elements[1].rows.first.cells.first.properties.table_cell_margin.left).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableCell | SetCellMarginRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellmarginright.js')
    expect(docx.elements[1].rows.first.cells.first.properties.table_cell_margin.right).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableCell | SetCellMarginTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setcellmargintop.js')
    expect(docx.elements[1].rows.first.cells.first.properties.table_cell_margin.top).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableCell | SetNoWrap method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setnowrap.js')
    expect(docx.elements[1].rows.first.cells.first.properties.no_wrap).to be_truthy
  end

  it 'ApiTableCell | SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setshd.js')
    expect(docx.elements[1].rows.first.cells.first.properties.shd).to eq(OoxmlParser::Color.new(255, 104, 0))
  end

  it 'ApiTableCell | SetTextDirection method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/settextdirection.js')
    expect(docx.elements[1].rows.first.cells.first.properties.text_direction).to eq(:bottom_to_top_left_to_right)
    expect(docx.elements[1].rows.first.cells[1].properties.text_direction).to eq(:top_to_bottom_right_to_left)
    expect(docx.elements[1].rows.first.cells[2].properties.text_direction).to eq(:left_to_right_top_to_bottom)
  end

  it 'ApiTableCell | SetVerticalAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setverticalalign.js')
    expect(docx.elements[1].rows.first.cells.first.properties.vertical_align).to eq(:top)
    expect(docx.elements[1].rows.first.cells[1].properties.vertical_align).to eq(:center)
    expect(docx.elements[1].rows.first.cells[2].properties.vertical_align).to eq(:bottom)
  end

  it 'ApiTableCell | SetWidth method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCell/setwidth.js')
    expect(docx.elements[1].rows.first.cells.first.properties.table_cell_width).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end
end

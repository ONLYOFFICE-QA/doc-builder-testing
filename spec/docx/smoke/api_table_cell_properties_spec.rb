require 'spec_helper'
describe 'ApiTableCellPr section tests' do
  it 'ApiTableCellPr | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/getclasstype.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = tableCellPr')
  end

  it 'ApiTableCellPr | SetCellBorderBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellborderbottom.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.bottom.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.bottom.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.bottom.val).to eq(:single)
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.bottom.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTableCellPr | SetCellBorderLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellborderleft.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.left.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.left.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.left.val).to eq(:single)
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.left.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTableCellPr | SetCellBorderRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellborderright.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.right.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.right.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.right.val).to eq(:single)
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.right.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTableCellPr | SetCellBorderTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellbordertop.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.top.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.top.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.top.val).to eq(:single)
    expect(docx.elements[1].properties.table_style.table_cell_properties.borders_properties.top.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTableCellPr | SetCellMarginBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellmarginbottom.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.table_cell_margin.bottom).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableCellPr | SetCellMarginLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellmarginleft.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.table_cell_margin.left).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableCellPr | SetCellMarginRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellmarginright.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.table_cell_margin.right).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableCellPr | SetCellMarginTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setcellmargintop.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.table_cell_margin.top).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTableCellPr | SetNoWrap method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setnowrap.js')
    expect(docx.elements[1].rows.first.cells.first.properties.no_wrap).to be_truthy
  end

  it 'ApiTableCellPr | SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setshd.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.shade.fill).to eq(OoxmlParser::Color.new(255, 104, 0))
  end

  it 'ApiTableCellPr | SetTextDirection method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/settextdirection.js')
    expect(docx.elements[1].rows.first.cells.first.properties.text_direction).to eq(:bottom_to_top_left_to_right)
  end

  it 'ApiTableCellPr | SetVerticalAlign method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setverticalalign.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.vertical_align).to eq(:bottom)
  end

  it 'ApiTableCellPr | SetWidth method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTableCellPr/setwidth.js')
    expect(docx.elements[1].properties.table_style.table_cell_properties.table_cell_width).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end
end

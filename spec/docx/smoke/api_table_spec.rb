require 'spec_helper'
describe 'ApiTable section tests' do
  it 'ApiTable | AddColumn method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/addcolumn.js')
    expect(docx.elements[1].rows.count).to eq(2)
    expect(docx.elements[1].rows.first.cells.count).to eq(3)
  end

  it 'ApiTable | AddRow method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/addrow.js')
    expect(docx.elements[1].rows.count).to eq(3)
    expect(docx.elements[1].rows.first.cells.count).to eq(2)
  end

  it 'ApiTable | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/getclasstype.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('Class Type = table')
  end

  it 'ApiTable | GetRow method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/getrow.js')
    expect(docx.elements[1].rows.count).to eq(3)
    expect(docx.elements[1].rows.first.cells.count).to eq(2)
  end

  it 'ApiTable | GetRowsCount method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/getrowscount.js')
    expect(docx.elements.first.nonempty_runs.first.text).to eq('We create a 2x2 table and add a new row, so that it becomes 2x3:')
    expect(docx.elements[3].nonempty_runs.first.text).to eq('The table above had 2 rows before we added a new one. ')
  end

  it 'ApiTable | MergeCells method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/mergecells.js')
    expect(docx.elements[1].rows[1].cells[1].properties.grid_span.count_of_merged_cells).to eq(2)
    expect(docx.elements[1].rows[1].cells.count).to eq(4)
    expect(docx.elements[1].rows[0].cells.count).to eq(5)
  end

  it 'ApiTable | RemoveColumn method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/removecolumn.js')
    expect(docx.elements[1].rows.count).to eq(3)
    expect(docx.elements[1].rows.first.cells.count).to eq(2)
  end

  it 'ApiTable | RemoveRow method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/removerow.js')
    expect(docx.elements[1].rows.count).to eq(2)
    expect(docx.elements[1].rows.first.cells.count).to eq(3)
  end

  it 'ApiTable | SetCellSpacing method' do
    skip 'http://bugzilla.onlyoffice.com/show_bug.cgi?id=33103'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setcellspacing.js')
    expect(docx.elements[1].properties.table_cell_spacing).to eq(OoxmlParser::OoxmlSize(720, :twip))
  end

  it 'ApiTable | SetJc method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setjc.js')
    expect(docx.elements[1].properties.jc).to eq(:center)
  end

  it 'ApiTable | SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setshd.js')
    expect(docx.elements[1].properties.shade.fill).to eq(OoxmlParser::Color.new(238, 238, 238))
    expect(docx.elements[1].properties.shade.value).to eq(:clear)
  end

  it 'ApiTable | SetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setstyle.js')
    expect(docx.elements[1].properties.table_style.name).to eq('Bordered - Accent 5')
  end

  it 'ApiTable | SetStyleColBandSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setstylecolbandsize.js')
    expect(docx.elements[1].properties.table_style_column_band_size.value).to eq(2)
  end

  it 'ApiTable | SetStyleRowBandSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setstylerowbandsize.js')
    expect(docx.elements[1].properties.table_style_row_band_size.value).to eq(2)
  end

  it 'ApiTable | SetTableBorderBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderbottom.js')
    expect(docx.elements[1].properties.table_borders.bottom.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_borders.bottom.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_borders.bottom.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_borders.bottom.val).to eq(:single)
  end

  it 'ApiTable | SetTableBorderInsideH method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderinsideh.js')
    expect(docx.elements[1].properties.table_borders.inside_horizontal.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements[1].properties.table_borders.inside_horizontal.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_borders.inside_horizontal.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_borders.inside_horizontal.val).to eq(:single)
  end

  it 'ApiTable | SetTableBorderInsideV method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderinsidev.js')
    expect(docx.elements[1].properties.table_borders.inside_vertical.color).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements[1].properties.table_borders.inside_vertical.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_borders.inside_vertical.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_borders.inside_vertical.val).to eq(:single)
  end

  it 'ApiTable | SetTableBorderLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderleft.js')
    expect(docx.elements[1].properties.table_borders.left.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_borders.left.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_borders.left.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_borders.left.val).to eq(:single)
  end

  it 'ApiTable | SetTableBorderRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableborderright.js')
    expect(docx.elements[1].properties.table_borders.right.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_borders.right.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_borders.right.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_borders.right.val).to eq(:single)
  end

  it 'ApiTable | SetTableBorderTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablebordertop.js')
    expect(docx.elements[1].properties.table_borders.top.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_borders.top.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_borders.top.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_borders.top.val).to eq(:single)
  end

  it 'ApiTable | SetTableCellMarginBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablecellmarginbottom.js')
    expect(docx.elements[1].properties.table_cell_margin.bottom).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTable | SetTableCellMarginLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablecellmarginleft.js')
    expect(docx.elements[1].properties.table_cell_margin.left).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTable | SetTableCellMarginRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablecellmarginright.js')
    expect(docx.elements[1].properties.table_cell_margin.right).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTable | SetTableCellMarginTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablecellmargintop.js')
    expect(docx.elements[1].properties.table_cell_margin.top).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTable | SetTableInd method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/182'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settableind.js')
    expect(docx.elements[1].properties.table_indent).to eq(false)
  end

  it 'ApiTable | SetTableLayout method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablelayout.js')
    expect(docx.elements[1].table_properties.table_layout.type).to eq(:fixed)
  end

  it 'ApiTable | SetTableLook method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/settablelook.js')
    expect(docx.elements[1].properties.table_look.first_column).to be_truthy
    expect(docx.elements[1].properties.table_style.table_style_properties_list.first.table_cell_properties.shade.fill).to eq(OoxmlParser::Color.new(255, 0, 0))
    expect(docx.elements[1].properties.table_look.first_row).to be_truthy
    expect(docx.elements[1].properties.table_look.last_column).to be_truthy
    expect(docx.elements[1].properties.table_look.first_row).to be_truthy
    expect(docx.elements[1].properties.table_look.no_horizontal_banding).to be_falsey
    expect(docx.elements[1].properties.table_look.no_vertical_banding).to be_falsey
  end

  it 'ApiTable | SetWidth method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/253'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTable/setwidth.js')
    expect(docx.elements[1].properties.table_width).to eq(OoxmlParser::OoxmlSize.new(5000, :pct))
  end
end

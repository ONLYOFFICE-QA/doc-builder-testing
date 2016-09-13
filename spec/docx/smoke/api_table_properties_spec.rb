require 'spec_helper'
describe 'ApiTablePr section tests' do
  it 'ApiTablePr | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/getclasstype.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('Class Type = tablePr')
  end

  it 'ApiTablePr | SetCellSpacing method' do
    pending 'http://bugzilla.onlyoffice.com/show_bug.cgi?id=33103'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setcellspacing.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_spacing).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiTablePr | SetJc method' do
    skip ' Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/228'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setjc.js')
    expect(docx.elements[1].properties.jc).to eq(:centger)
  end

  it 'ApiTablePr | SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setshd.js')
    expect(docx.elements[1].properties.table_style.table_properties.shade.fill).to eq(OoxmlParser::Color.new(238, 238, 238))
    expect(docx.elements[1].properties.table_style.table_properties.shade.value).to eq(:clear)
  end

  it 'ApiTablePr | SetStyleColBandSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setstylecolbandsize.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_style_column_band_size.value).to eq(2)
  end

  it 'ApiTablePr | SetStyleRowBandSize method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setstylerowbandsize.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_style_row_band_size.value).to eq(2)
  end

  it 'ApiTablePr | SetTableBorderBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderbottom.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.bottom.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.bottom.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.bottom.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.bottom.val).to eq(:single)
  end

  it 'ApiTablePr | SetTableBorderInsideH method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderinsideh.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_horizontal.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_horizontal.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_horizontal.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_horizontal.val).to eq(:single)
  end

  it 'ApiTablePr | SetTableBorderInsideV method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderinsidev.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_vertical.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_vertical.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_vertical.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.inside_vertical.val).to eq(:single)
  end

  it 'ApiTablePr | SetTableBorderLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderleft.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.left.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.left.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.left.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.left.val).to eq(:single)
  end

  it 'ApiTablePr | SetTableBorderRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableborderright.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.right.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.right.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.right.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.right.val).to eq(:single)
  end

  it 'ApiTablePr | SetTableBorderTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablebordertop.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.top.color).to eq(OoxmlParser::Color.new(0, 0, 255))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.top.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.top.sz).to eq(OoxmlParser::OoxmlSize.new(32, :one_eighth_point))
    expect(docx.elements[1].properties.table_style.table_properties.table_borders.top.val).to eq(:single)
  end

  it 'ApiTablePr | SetTableCellMarginBottom method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablecellmarginbottom.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.bottom).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTablePr | SetTableCellMarginLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablecellmarginleft.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.left).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTablePr | SetTableCellMarginRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablecellmarginright.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.right).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTablePr | SetTableCellMarginTop method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablecellmargintop.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_cell_margin.top).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
  end

  it 'ApiTablePr | SetTableInd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settableind.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_indent).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiTablePr | SetTableLayout method' do
    skip 'Documentation error http://192.168.4.102/developers/document-builder/ApiTablePr/SetTableLayout.aspx'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/settablelayout.js')
    expect(docx.elements[1].properties.table_style.table_properties.table_layout.type).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiTablePr | SetWidth method' do
    skip 'Documentation error http://192.168.4.102/developers/document-builder/ApiTablePr/SetWidth.aspx'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiTablePr/setwidth.js')
    expect(docx.nil?).to eq(false)
  end
end

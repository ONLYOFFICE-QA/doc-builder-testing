builder.CreateFile("docx");

var oDocument, oSection, oTextPr, oParaPr, oRun, oTable;
var oParagraph, oTableRow, oCell, oNumbering, oTablePr;
var oTableCellPr, oDrawing, oCell2, oTableRow2;
var oTable2, oTable3, oTableRow3, oCell3;
var oTable4, oTableRow4, oCell4;

oDocument = Api.GetDocument();

// page settings
oSection = oDocument.GetFinalSection();
oSection.SetPageMargins(2520, 1440, 2520, 1440);
oSection.SetPageSize(12240, 15840, false);
oSection.SetType("nextPage");

// default text properties
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetFontSize(24);
oTextPr.SetLanguage("en-US");
oTextPr.SetFontFamily("Gabriola");
oTextPr.SetSpacing(0);
oTextPr.SetPosition(0);

// default paragraph properties
oParaPr = oDocument.GetDefaultParaPr();
oParaPr.SetSpacingLine(180, "auto");
oParaPr.SetSpacingBefore(0);
oParaPr.SetSpacingAfter(0);
oParaPr.SetJc("left");
oParaPr.SetIndLeft(0);
oParaPr.SetIndRight(0);
oParaPr.SetIndFirstLine(0);

// subtitle style
var oSubTitleStyle = oDocument.CreateStyle("Subtitle Custom", "paragraph");

oTextPr = oSubTitleStyle.GetTextPr();
oTextPr.SetFontSize(28);

// title style
var oTitleStyle = oDocument.CreateStyle("Title Custom", "paragraph");

oTextPr = oTitleStyle.GetTextPr();
oTextPr.SetFontSize(64);
oTextPr.SetFontFamily("Gabriola");

oParaPr = oTitleStyle.GetParaPr();
oParaPr.SetSpacingAfter(290);
oParaPr.SetSpacingLine(168, "auto");

// table style
var oTableStyle = oDocument.CreateStyle("TableStyle", "table");

oTablePr = oTableStyle.GetTablePr();
oTablePr.SetTableInd(0);
oTablePr.SetJc("center");
oTablePr.SetTableLayout("fixed");
oTablePr.SetWidth("auto");
oTablePr.SetTableCellMarginRight(0);
oTablePr.SetTableCellMarginLeft(0);

// table
oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oDocument.RemoveElement(0);

oTable.SetStyle(oTableStyle);
oTable.SetWidth(7200);
oTable.SetTableLook(true, true, false, false, true, false);

for (var nRow = 0; nRow <= 2; nRow += 2) {
	// row
	oTableRow = oTable.GetRow(nRow);
	oTableRow.SetHeight("atLeast", 5040);

	// cells
	oCell = oTable.GetRow(nRow).GetCell(0);
	oDrawing = Api.CreateImage("https://testing-documentserver-files.s3.amazonaws.com/png/d4623fd6-eec2-11e6-98a8-263e7d75e538.png", 1167386, 2928086);
	oCell.GetContent().GetElement(0).AddDrawing(oDrawing);
	oCell.GetContent().GetElement(0).SetJc("right");
	oCell.GetContent().GetElement(0).SetSpacingLine(240, "auto");
	oCell.SetVerticalAlign("center");

	oCell.SetWidth("twips", 2088);

	oCell = oTable.GetRow(nRow).GetCell(1);
	oCell.SetWidth("twips", 360);

	oCell = oTable.GetRow(nRow).GetCell(2);
	oCell.SetWidth("twips", 4752);

	// table 3rd cell
	oTable2 = Api.CreateTable(1, 2);
	oTable2.SetTableCellMarginRight(0);
	oTable2.SetTableCellMarginLeft(0);

	// inner table
	oCell = oTable.GetRow(nRow).GetCell(2).GetContent();
	oCell.Push(oTable2);
	oCell.RemoveElement(0);
	// inner table

	// row
	oTableRow2 = oTable2.GetRow(0);
	oTableRow2.SetHeight("atLeast", 1339);

	oTableRow2 = oTable2.GetRow(1);
	oTableRow2.SetHeight("atLeast", 3701);

	// cells
	oCell2 = oTable2.GetRow(0).GetCell(0);
	oCell2.SetWidth("twips", 4752);


	// subtitle
	oCell2 = oTable2.GetRow(1).GetCell(0);
	oParagraph = oCell2.GetContent().GetElement(0);
	oParagraph.SetStyle(oSubTitleStyle);

	oRun = Api.CreateRun();
	oRun.AddText("Please respond by");

	oParagraph.AddElement(oRun);

	// title
	oParagraph = Api.CreateParagraph();
	oParagraph.SetStyle(oTitleStyle);

	oRun = Api.CreateRun();
	oRun.AddText("September 30th");

	oParagraph.AddElement(oRun);
	oTable2.GetRow(1).GetCell(0).GetContent().Push(oParagraph);

	// table 3
	oTable3 = Api.CreateTable(1, 2);
	oTable3.SetTableCellMarginRight(0);
	oTable3.SetTableCellMarginLeft(0);
	oTable3.SetWidth("twips", 4032);

	// inner lvl 2 table (table 3)
	oCell2 = oTable2.GetRow(1).GetCell(0).GetContent();
	oCell2.Push(oTable3);

	// empty paragraph text size 20
	oParagraph = Api.CreateParagraph();

	oRun = Api.CreateRun();
	oRun.SetFontSize(20);
	oRun.AddText("");

	oParagraph.AddElement(oRun);
	// empty paragraph text size 20
	oCell2.GetElement(oCell2.GetElementsCount() - 1).AddElement(oRun);
	// inner lvl 2 table (table 3)

	// row
	oTableRow3 = oTable3.GetRow(0);
	oTableRow3.SetHeight("atLeast", 360);

	oTableRow3 = oTable3.GetRow(1);
	oTableRow3.SetHeight("atLeast", 360);

	oCell3 = oTable3.GetRow(1).GetCell(0);
	oCell3.SetVerticalAlign("bottom");
	oCell3.SetCellBorderBottom("single", 4, 0, 0x00, 0x00, 0x00);

	oCell3 = oTable3.GetRow(0).GetCell(0);
	oCell3.SetVerticalAlign("bottom");
	oCell3.SetCellBorderBottom("single", 4, 0, 0x00, 0x00, 0x00);

	oParagraph = oCell3.GetContent().GetElement(0);

	oRun = Api.CreateRun();
	oRun.AddText("M");

	oParagraph.AddElement(oRun);

	// table 4
	oTable4 = Api.CreateTable(4, 1);
	oTable4.SetTableCellMarginRight(0);
	oTable4.SetTableCellMarginLeft(0);
	oTable4.SetWidth("twips", 3456);

	// inner lvl 2 table 2 (table 4)
	oCell2 = oTable2.GetRow(1).GetCell(0).GetContent();
	oCell2.Push(oTable4);
	// inner lvl 2 table 2 (table 4)

	// cells
	oCell4 = oTable4.GetRow(0).GetCell(0);
	oCell4.SetWidth("twips", 432);
	oCell4.GetContent().GetElement(0).SetJc("center");
	oCell4.SetCellBorderBottom("single", 4, 0, 0x00, 0x00, 0x00);

	oCell4 = oTable4.GetRow(0).GetCell(1);
	oCell4.SetWidth("twips", 1296);
	oCell4.GetContent().GetElement(0).SetJc("left");
	oCell4.GetContent().GetElement(0).AddText("Accepts");

	oCell4 = oTable4.GetRow(0).GetCell(2);
	oCell4.SetWidth("twips", 432);
	oCell4.GetContent().GetElement(0).SetJc("center");
	oCell4.SetCellBorderBottom("single", 4, 0, 0x00, 0x00, 0x00);

	oCell4 = oTable4.GetRow(0).GetCell(3);
	oCell4.SetWidth("twips", 1296);
	oCell4.GetContent().GetElement(0).SetJc("left");
	oCell4.GetContent().GetElement(0).AddText("Regrets");
}

// middle cell
oTableRow = oTable.GetRow(1);
oTableRow.SetHeight("atLeast", 1440);

builder.SaveFile("docx", "rsvp_cards.docx");
builder.CloseFile();

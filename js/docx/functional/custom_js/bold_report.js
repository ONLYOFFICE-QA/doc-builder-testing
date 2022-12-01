builder.CreateFile("docx");
var oDocument, oSection, oTextPr, oParaPr, oRun, oTable;
var oParagraph, oTableRow, oCell, oNumbering, oTablePr;
var oTableCellPr;

oDocument = Api.GetDocument();

// page settings
oSection = oDocument.GetFinalSection();
oSection.SetPageMargins(1123, 979, 1123, 1440);
oSection.SetPageSize(12240, 15840, true);
oSection.SetType("nextPage");


// default text properties
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetFontSize(24);
oTextPr.SetLanguage("en-US");
oTextPr.SetFontFamily("Arial");
oTextPr.SetSpacing(0);
oTextPr.SetPosition(0);
oTextPr.SetColor(0x94, 0x91, 0x8A, false);


// default paragraph properties
oParaPr = oDocument.GetDefaultParaPr();
oParaPr.SetSpacingLine(312, "auto");
oParaPr.SetSpacingBefore(0);
oParaPr.SetSpacingAfter(240);
oParaPr.SetJc("left");


// title
var oTitleStyle = oDocument.CreateStyle("Title");

oTextPr = oTitleStyle.GetTextPr();
oTextPr.SetFontSize(78);
oTextPr.SetFontFamily("Georgia");
oTextPr.SetColor(0x23, 0x22, 0x20, false);
oTextPr.SetBold(true);

oParaPr = oTitleStyle.GetParaPr();
oParaPr.SetContextualSpacing(true);
oParaPr.SetIndRight(3614);
oParaPr.SetSpacingLine(240, "auto");
oParaPr.SetSpacingAfter(1600);


// heading 1
var oHeading1Style = oDocument.CreateStyle("Heading 1");

oTextPr = oHeading1Style.GetTextPr();
oTextPr.SetFontSize(48);
oTextPr.SetFontFamily("Georgia");
oTextPr.SetColor(0x23, 0x22, 0x20, false);
oTextPr.SetBold(true);

oParaPr = oHeading1Style.GetParaPr();
oParaPr.SetIndRight(3614);
oParaPr.SetSpacingLine(240, "auto");
oParaPr.SetSpacingAfter(200);
oParaPr.SetSpacingBefore(600);
oParaPr.SetKeepLines(true);
oParaPr.SetKeepNext(true);


// list bullet
var oListBulletStyle = oDocument.CreateStyle("List Bullet");

oParaPr = oListBulletStyle.GetParaPr();
oNumbering = oDocument.CreateNumbering("bullet");
oParaPr.SetNumPr(oNumbering);
oParaPr.SetIndLeft(432);
oParaPr.SetIndFirstLine(-431);
//oParaPr.SetTabs([432], ["left"]); // check this xml mention clear value for aPos


// quote style
var oQuoteStyle = oDocument.CreateStyle("Quote");

oTextPr = oQuoteStyle.GetTextPr();
oTextPr.SetFontSize(36);
oTextPr.SetFontFamily("Georgia");
oTextPr.SetColor(0x23, 0x22, 0x20, false);
oTextPr.SetItalic(true);

oParaPr = oQuoteStyle.GetParaPr();
oParaPr.SetSpacingAfter(360);
oParaPr.SetSpacingBefore(240);
oParaPr.SetSpacingLine(240, "auto");


// table style
var oTableStyle = oDocument.CreateStyle("Bold Report", "table");

oTablePr = oTableStyle.GetTablePr();
oTablePr.SetTableInd(0);
oTablePr.SetTableCellMarginBottom(0);
oTablePr.SetTableCellMarginTop(0);
oTablePr.SetTableCellMarginRight(108);
oTablePr.SetTableCellMarginLeft(108);

oTableCellPr = oTableStyle.GetTableCellPr();
oTableCellPr.SetVerticalAlign("bottom");

oParaPr = oTableStyle.GetParaPr();
oParaPr.SetSpacingAfter(120);
oParaPr.SetSpacingBefore(120);
oParaPr.SetSpacingLine(240, "auto");


// table heading text style
var oTableHeadingStyle = oDocument.CreateStyle("Bold Report heading");

oTextPr = oTableHeadingStyle.GetTextPr();
oTextPr.SetFontSize(24);
oTextPr.SetFontFamily("Georgia");
oTextPr.SetColor(0x23, 0x22, 0x20, false);
oTextPr.SetBold(true);


// title text
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oTitleStyle);
oRun = Api.CreateRun();
oRun.AddText("[Title]");
oParagraph.AddElement(oRun);


// heading 1 text
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading1Style);
oRun = Api.CreateRun();
oRun.AddText("Get Started Right Away");
oParagraph.AddElement(oRun);
oDocument.Push(oParagraph);


// normal text 1
oParagraph = Api.CreateParagraph();
oRun = Api.CreateRun();
oRun.AddText("To replace the placeholder text on this page, just select a line of text and start typing. But don’t do that just yet!");
oParagraph.AddElement(oRun);
oDocument.Push(oParagraph);


// normal text 2
oParagraph = Api.CreateParagraph();
oRun = Api.CreateRun();
oRun.AddText("First check out a few tips to help you quickly format your report. You might be amazed at how easy it is.");
oParagraph.AddElement(oRun);
oDocument.Push(oParagraph);


// list bullet 1
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oListBulletStyle);
oParagraph.AddText("Need a heading? On the Home tab, in the Styles gallery, just tap the heading style you want.");
oDocument.Push(oParagraph);


// list bullet 2
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oListBulletStyle);
oParagraph.AddText("Get other styles for text such as bullets or quotes, including this style-List Bullet.");
oDocument.Push(oParagraph);


// quote
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oQuoteStyle);
oParagraph.AddText("\"This is the Quote style.\""); 
oDocument.Push(oParagraph);


// table
oTable = Api.CreateTable(4, 3);

oTable.SetStyle(oTableStyle);
oTable.SetTableLayout("autofit");
oTable.SetTableCellMarginRight(619);
oTable.SetTableCellMarginLeft(0);
oTable.SetTableLook(true, true, false, false, true, false);


// cells
for (var i = 0; i < 4; i++) {
	oCell = oTable.GetRow(0).GetCell(i);
	oCell.SetWidth("twips", 2499);
	oCell.SetCellBorderBottom("single", 12, 0, 0x23, 0x22, 0x20);

	if (i > 0) {
		oRun = Api.CreateRun();
		oRun.AddText("[Column Head]");
		oRun.SetStyle(oTableHeadingStyle);
		oCell.GetContent().GetElement(0).AddElement(oRun);
	}

}

for (var i = 1; i <= 2; i++) {
	oRun = Api.CreateRun();
	oRun.AddText("[Row head]");
	oRun.SetStyle(oTableHeadingStyle);
	oTable.GetRow(i).GetCell(0).GetContent().GetElement(0).AddElement(oRun);
}

oRun = Api.CreateRun();
oRun.AddText("[Table text]");
oTable.GetRow(1).GetCell(1).GetContent().GetElement(0).AddElement(oRun);
oDocument.Push(oTable);


// heading 1 text after table
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading1Style);
oParagraph.AddText("Look Great Every Time");
oDocument.Push(oParagraph);


// normal text after table
oParagraph = Api.CreateParagraph();
oParagraph.AddText("For best results when selecting text to copy or edit, don’t include space to the right of the characters in your selection.");
oDocument.Push(oParagraph);



builder.SaveFile("docx", "bold_report.docx");
builder.CloseFile();

builder.CreateFile("docx");
var oParaPr, oRun, oHeading1Style, oTextPr, oNoSpacingStyle, oNormalStyle;
var oTable, oDocument, oParagraph;
oDocument = Api.GetDocument();


// for easier reading
function applyTextPrStyle(fontSize, lang, fontFamily, isBold) {
    oTextPr.SetFontSize(fontSize);
    oTextPr.SetLanguage(lang);
    oTextPr.SetFontFamily(fontFamily);
    oTextPr.SetBold(isBold);
};


// for easier reading
function applyParagraphPrStyle(spacingAfter, spacingLineNum, spacingLineString) {
    oParaPr.SetSpacingAfter(spacingAfter);
    oParaPr.SetSpacingLine(spacingLineNum, spacingLineString);
};


// for easier reading
function applyTableStyle(tableCellMarginRight, tableCellMarginLeft, tableLayout) {
	oTable.SetTableCellMarginRight(tableCellMarginRight);
	oTable.SetTableCellMarginLeft(tableCellMarginLeft);
	oTable.SetTableLayout(tableLayout);
};


// default paragraph style
oNormalStyle = oDocument.GetDefaultStyle("paragraph");
oTextPr = oNormalStyle.GetTextPr();
applyTextPrStyle(28, "en-US", "Trebuchet MS", true);
oParaPr = oNormalStyle.GetParaPr();
applyParagraphPrStyle(0.11 * 1440, 1 * 240, "auto");


// No Spacing paragraph style
oNoSpacingStyle = oDocument.GetStyle("No Spacing");
oTextPr = oNoSpacingStyle.GetTextPr();
applyTextPrStyle(24, "en-US", "Trebuchet MS", true);
oParaPr = oNoSpacingStyle.GetParaPr();
applyParagraphPrStyle(0 * 1440, 1 * 240, "auto");


// title text style
oHeading1Style = oDocument.CreateStyle("Title", "paragraph");
oParaPr = oHeading1Style.GetParaPr();
applyParagraphPrStyle(0.31 * 1440, 0.9 * 240, "auto");
// todo: cover with function
oParaPr.SetContextualSpacing(true);
oParaPr.SetIndLeft(-0.02 * 1440);
// end of todo
oTextPr = oHeading1Style.GetTextPr();
applyTextPrStyle(104, "en-US", "Trebuchet MS", true);
// todo: cover with function
oTextPr.SetColor(0x7f, 0x7f, 0x7f, false);
// end of todo


// title text filling
oRun = Api.CreateRun();
oRun.AddText("Fax");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oHeading1Style);
oParagraph.AddElement(oRun);


// first table
oTable = Api.CreateTable(2, 2);
applyTableStyle(1440 * 0.1, 1440 * 0, "fixed");

// top left cell
oCell = oTable.GetRow(0).GetCell(0);
oCell.SetWidth("twips", 1440 * 1.56);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("Date:");
oParagraph.AddElement(oRun);
oParaPr = oParagraph.GetParaPr();
applyParagraphPrStyle(160, 240, "auto");

// top right cell 
oCell = oTable.GetRow(0).GetCell(1);
oCell.SetWidth("twips", 1440 * 5.44);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("[Date]");
oParagraph.AddElement(oRun);

// bottom left cell
oCell = oTable.GetRow(1).GetCell(0);
oCell.SetWidth("twips", 1440 * 1.56);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("Subject:");
oParagraph.AddElement(oRun);

// bottom right cell
oCell = oTable.GetRow(1).GetCell(1);
oCell.SetWidth("twips", 1440 * 5.44);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("[Subject]");
oParagraph.AddElement(oRun);

oDocument.Push(oTable);
// end of first table

// no spacing line between tables
oParagraph = oDocument.GetElement(oDocument.GetElementsCount() - 1);
oParagraph.SetStyle(oNoSpacingStyle);


// second table
oTable = Api.CreateTable(2, 3);
applyTableStyle(1440 * 0.1, 1440 * 0, "fixed");

// top left cell
oCell = oTable.GetRow(0).GetCell(0);
oCell.SetWidth("twips", 1440 * 1.56);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("To:");
oParagraph.AddElement(oRun);
oParaPr = oParagraph.GetParaPr();
applyParagraphPrStyle(160, 240, "auto");

// top right cell
oCell = oTable.GetRow(0).GetCell(1);
oCell.SetWidth("twips", 1440 * 5.44);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("[Recipient Name]");
oParagraph.AddElement(oRun);

// middle left cell
oCell = oTable.GetRow(1).GetCell(0);
oCell.SetWidth("twips", 1440 * 1.56);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("Phone:");
oParagraph.AddElement(oRun);

// middle right cell
oCell = oTable.GetRow(1).GetCell(1);
oCell.SetWidth("twips", 1440 * 5.44);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("[Telephone]");
oParagraph.AddElement(oRun);

// bottom left cell
oCell = oTable.GetRow(2).GetCell(0);
oCell.SetWidth("twips", 1440 * 1.56);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("Fax:");
oParagraph.AddElement(oRun);

// bottom right cell
oCell = oTable.GetRow(2).GetCell(1);
oCell.SetWidth("twips", 1440 * 5.44);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("[Fax]");
oParagraph.AddElement(oRun);

oDocument.Push(oTable);
// end of second table

// no spacing line between tables
oParagraph = oDocument.GetElement(oDocument.GetElementsCount() - 1);
oParagraph.SetStyle(oNoSpacingStyle);


// third table
oTable = Api.CreateTable(2, 3);
applyTableStyle(1440 * 0.1, 1440 * 0, "fixed");

// top left cell
oCell = oTable.GetRow(0).GetCell(0);
oCell.SetWidth("twips", 1440 * 1.56);
oParagraph = oCell.GetContent().GetElement(0);
oParaPr = oParagraph.GetParaPr();
applyParagraphPrStyle(160, 240, "auto");
oRun = Api.CreateRun();
oRun.AddText("From:");
oParagraph.AddElement(oRun);

// top right cell
oCell = oTable.GetRow(0).GetCell(1);
oCell.SetWidth("twips", 1440 * 5.44);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("[Sender Name]");
oParagraph.AddElement(oRun);

// middle left cell
oCell = oTable.GetRow(1).GetCell(0);
oCell.SetWidth("twips", 1440 * 1.56);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("Phone:");
oParagraph.AddElement(oRun);

// middle right cell
oCell = oTable.GetRow(1).GetCell(1);
oCell.SetWidth("twips", 1440 * 5.44);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("[Telephone]");
oParagraph.AddElement(oRun);

// bottom left cell
oCell = oTable.GetRow(2).GetCell(0);
oCell.SetWidth("twips", 1440 * 1.56);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("Fax:");
oParagraph.AddElement(oRun);

// bottom right cell
oCell = oTable.GetRow(2).GetCell(1);
oCell.SetWidth("twips", 1440 * 5.44);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("[Fax]");
oParagraph.AddElement(oRun);

oDocument.Push(oTable);
// end of third table

// no spacing line between tables
oParagraph = oDocument.GetElement(oDocument.GetElementsCount() - 1);
oParagraph.SetStyle(oNoSpacingStyle);


// fourth table
oTable = Api.CreateTable(2, 1);
applyTableStyle(1440 * 0.1, 1440 * 0, "fixed");

// left cell
oCell = oTable.GetRow(0).GetCell(0);
oCell.SetWidth("twips", 1440 * 1.56);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("No. of pages:");
oParagraph.AddElement(oRun);
oParaPr = oParagraph.GetParaPr();
applyParagraphPrStyle(160, 240, "auto");

// right cell
oCell = oTable.GetRow(0).GetCell(1);
oCell.SetWidth("twips", 1440 * 5.44);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("[No. of pages]");
oParagraph.AddElement(oRun);

oDocument.Push(oTable);
// end of fourth table

// no spacing line between tables
oParagraph = oDocument.GetElement(oDocument.GetElementsCount() - 1);
oParagraph.SetStyle(oNoSpacingStyle);


// fifth table
oTable = Api.CreateTable(2, 1);
applyTableStyle(1440 * 0.1, 1440 * 0, "fixed");

// left cell
oCell = oTable.GetRow(0).GetCell(0);
oCell.SetWidth("twips", 1440 * 1.56);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("Message:");
oParagraph.AddElement(oRun);
oParaPr = oParagraph.GetParaPr();
applyParagraphPrStyle(320, 240, "auto");

// right cell
oCell = oTable.GetRow(0).GetCell(1);
oCell.SetWidth("twips", 1440 * 5.44);
oParagraph = oCell.GetContent().GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("");
oParagraph.AddElement(oRun);

oDocument.Push(oTable);
// end of fifth table

// first paragraph after tables
oParagraph = oDocument.GetElement(oDocument.GetElementsCount() - 1);
oParagraph.AddText("[Start your message here.");
oParaPr = oParagraph.GetParaPr();
applyParagraphPrStyle(0, 300, "auto");
oParaPr.SetSpacingBefore(0.19 * 1440);

// second paragraph after tables
oParagraph = Api.CreateParagraph();
oParagraph.AddText("To easily replace placeholder text (such as this) with your own, just select a line or paragraph and start typing. For best results, don’t include space to the left or right of the characters in your selection.]");
oParaPr = oParagraph.GetParaPr();
applyParagraphPrStyle(0, 300, "auto");
oParaPr.SetSpacingBefore(0.19 * 1440);
oDocument.Push(oParagraph);

// page settings
oSection = oDocument.GetFinalSection();
oSection.SetPageMargins(0.75 * 1440, 0.65 * 1440, 0.75 * 1440, 0.5 * 1440);
oSection.SetPageSize(8.5 * 1440, 11 * 1440, true);
oSection.SetFooterDistance(0.5 * 1440);
oSection.SetHeaderDistance(0.5 * 1440);
builder.SaveFile("docx", "fax_cover.docx");
builder.CloseFile();

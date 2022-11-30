builder.CreateFile("docx");
var oParaPr, oRun, oTextPr;
var oTable, oDocument, oParagraph, oDrawing;
var oTableInner, oCellInner, oRowInner, oParagraphInner;

var Api = editor;

oDocument = Api.GetDocument();


// page settings
oSection = oDocument.GetFinalSection();
oSection.SetPageMargins(1080, 2160, 1080, 2160);
oSection.SetPageSize(12240, 15840, true);
oSection.SetFooterDistance(720);
oSection.SetHeaderDistance(720);
oSection.SetType("nextPage");


// header
oHeader = oSection.GetHeader("default", true);
oParagraph = oHeader.GetElement(0);
//oParagraph.AddText("This is a page header");


// default text
oTextPr = oDocument.GetDefaultTextPr();

oTextPr.SetFontFamily("Georgia");
oTextPr.SetFontSize(22);
oTextPr.SetLanguage("en-US");
oTextPr.SetSpacing(0);
oTextPr.SetPosition(0);
oTextPr.SetColor(0x65, 0x61, 0x67, false);


// default paragraph
oParaPr = oDocument.GetDefaultParaPr();

oParaPr.SetJc("center");
oParaPr.SetIndLeft(0);
oParaPr.SetIndRight(0);
oParaPr.SetIndFirstLine(0);
oParaPr.SetSpacingAfter(160);
oParaPr.SetSpacingBefore(0);
oParaPr.SetSpacingLine(288, "auto");


// header text
var oHeaderTextStyle = oDocument.CreateStyle("header text", "paragprah");

oTextPr = oHeaderTextStyle.GetTextPr();
oTextPr.SetFontSize(36);
oTextPr.SetFontFamily("Trebuchet MS");
oTextPr.SetColor(0xFF, 0xFF, 0xFF, false);


// title
var oTitleStyle = oDocument.CreateStyle("Title custom", "paragraph");

oTextPr = oTitleStyle.GetTextPr();
oTextPr.SetFontSize(80);
oTextPr.SetColor(0x31, 0x2F, 0x32, false);
oTextPr.SetFontFamily("Trebuchet MS");

oParaPr = oTitleStyle.GetParaPr();
oParaPr.SetContextualSpacing(true);
oParaPr.SetSpacingAfter(40);
oParaPr.SetSpacingBefore(320);


// heading 1
var oHeading1Style = oDocument.CreateStyle("Heading 1 custom", "paragraph");

oTextPr = oHeading1Style.GetTextPr();
//oTextPr.SetFontFamily("Georgia");
oTextPr.SetFontSize(24);
oTextPr.SetColor(0xA2, 0xB1, 0x39, false);

oParaPr = oHeading1Style.GetParaPr();
oParaPr.SetContextualSpacing(true);
oParaPr.SetKeepLines(true);
oParaPr.SetKeepNext(true);
oParaPr.SetSpacingAfter(40);
oParaPr.SetSpacingBefore(560);


// heading 2
var oHeading2Style = oDocument.CreateStyle("Heading 2 custom", "paragraph");

oTextPr = oHeading2Style.GetTextPr();
oTextPr.SetFontFamily("Trebuchet MS");
oTextPr.SetFontSize(32);
oTextPr.SetColor(0x31, 0x2F, 0x32, false);

oParaPr = oHeading2Style.GetParaPr();
oParaPr.SetKeepLines(true);
oParaPr.SetKeepNext(true);
oParaPr.SetSpacingAfter(0);
oParaPr.SetSpacingBefore(60);


// title
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oTitleStyle);
oParagraph.AddText("[Menu Title]");


// Starter
// heading 1
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading1Style);
oParagraph.AddText("Starter");
oDocument.Push(oParagraph);


// heading 2
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading2Style);
oParagraph.AddText("[Starter Item]");
oDocument.Push(oParagraph);


// normal
oParagraph = Api.CreateParagraph();
oParagraph.AddText("[Description]");
oDocument.Push(oParagraph);


// heading 2
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading2Style);
oParagraph.AddText("[Starter Item]");
oDocument.Push(oParagraph);


// normal
oParagraph = Api.CreateParagraph();
oParagraph.AddText("[Description]");
oDocument.Push(oParagraph);
// End of Starter


// Main Course
// heading 1
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading1Style);
oParagraph.AddText("Main Course");
oDocument.Push(oParagraph);


// heading 2
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading2Style);
oParagraph.AddText("[Main Course Item]");
oDocument.Push(oParagraph);


// normal
oParagraph = Api.CreateParagraph();
oParagraph.AddText("[Description]");
oDocument.Push(oParagraph);


// heading 2
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading2Style);
oParagraph.AddText("[Main Course Item]");
oDocument.Push(oParagraph);


// normal
oParagraph = Api.CreateParagraph();
oParagraph.AddText("[Description]");
oDocument.Push(oParagraph);
// End of Main Course


// Dessert
// heading 1
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading1Style);
oParagraph.AddText("Dessert");
oDocument.Push(oParagraph);


// heading 2
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading2Style);
oParagraph.AddText("[Dessert Item]");
oDocument.Push(oParagraph);


// normal
oParagraph = Api.CreateParagraph();
oParagraph.AddText("[Description]");
oDocument.Push(oParagraph);


// heading 2
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading2Style);
oParagraph.AddText("[Dessert Item]");
oDocument.Push(oParagraph);


// normal
oParagraph = Api.CreateParagraph();
oParagraph.AddText("[Description]");
oDocument.Push(oParagraph);
// End of Dessert



oHeader = oSection.GetHeader("default", true);
oParagraph = oHeader.GetElement(0);
oFill = Api.CreateSolidFill(Api.CreateRGBColor(0xA2, 0xB1, 0x39));
oStroke = Api.CreateStroke(12700, Api.CreateSolidFill(Api.CreateRGBColor(0x77, 0x82, 0x2A)));
oDrawing = Api.CreateShape("ribbon2", 6296024, 733424, oFill, oStroke);
oDrawing.SetVerPosition("paragraph", 5 * 66674);
oDrawing.SetHorAlign("margin", "right");
oDrawing.SetWrappingStyle("inFront");
oParagraph.AddDrawing(oDrawing);


oParagraphInner = oDrawing.GetDocContent().GetElement(0);
oParagraphInner.SetStyle(oHeaderTextStyle);
oParagraphInner.AddText("Menu");




// TODO: change after finishing
builder.SaveFile("docx", "menu1_code.docx");
builder.CloseFile();

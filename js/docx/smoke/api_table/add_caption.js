builder.CreateFile("docx");
var oDocument= Api.GetDocument();
var oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered"));

var oTable1 = Api.CreateTable(3, 3);
oTable1.SetWidth("percent", 100);
oTable1.SetStyle(oTableStyle);
oDocument.Push(oTable1);
var oParagraph = Api.CreateParagraph();
oParagraph.AddText("Caption wiработаетthout parameters");
var oCell = oTable1.GetCell(0,0);
oTable1.AddElement(oCell, 0, oParagraph);
oTable1.AddCaption();

var oTable2 = Api.CreateTable(3, 3);
oTable2.SetWidth("percent", 100);
oTable2.SetStyle(oTableStyle);
oDocument.Push(oTable2);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Caption with additional text");
oCell = oTable2.GetCell(0,0);
oTable2.AddElement(oCell, 0, oParagraph);
oTable2.AddCaption(' caption text', "", false, "roman", false, null, "dash");

var oTable3 = Api.CreateTable(3, 3);
oTable3.SetWidth("percent", 100);
oTable3.SetStyle(oTableStyle);
oDocument.Push(oTable3);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Caption with bExludeLabel: true");
oCell = oTable3.GetCell(0,0);
oTable3.AddElement(oCell, 0, oParagraph);
oTable3.AddCaption(" caption text", "Figure", true, "ALPHABETIC", false, null, "colon");

var oTable4 = Api.CreateTable(3, 3);
oTable4.SetWidth("percent", 100);
oTable4.SetStyle(oTableStyle);
oDocument.Push(oTable4);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Caption with bBefore: true");
oCell = oTable4.GetCell(0,0);
oTable4.AddElement(oCell, 0, oParagraph);
oTable4.AddCaption("", "Equation", false, "alphabetic", true, null, "period");

builder.SaveFile("docx", "AddCaption.docx");
builder.CloseFile();
builder.CreateFile("docx");
var oDocument= Api.GetDocument();
var oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered"));
var headingArr = ["Heading 1", "Heading 2", "Heading 3"]
var oNewDocumentStyle
var oParagraph

var oNumbering = oDocument.CreateNumbering("numbered");
for (let nLvl = 0; nLvl < 3; ++nLvl) {
    var oNumLvl = oNumbering.GetLevel(nLvl);
    var sFormatString = ""
    for (let nTempLvl = 1; nTempLvl <= (nLvl + 1); ++nTempLvl) sFormatString += "%" + nTempLvl + ".";
    oNumLvl.SetCustomType("decimal", sFormatString, "left");
    oNewDocumentStyle = oDocument.GetStyle(headingArr[nLvl]);
    oParagraph = Api.CreateParagraph();
    oParagraph.SetStyle(oNewDocumentStyle);
    oParagraph.SetNumbering(oNumLvl);
    oParagraph.AddText(headingArr[nLvl]);
    oDocument.Push(oParagraph);
}

var oTable1 = Api.CreateTable(3, 3);
oTable1.SetWidth("percent", 100);
oTable1.SetStyle(oTableStyle);
oDocument.Push(oTable1);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Caption without parameters");
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
oTable2.AddCaption(' caption text', "Figure", false, "Arabic", false, null, "period");

var oTable3 = Api.CreateTable(3, 3);
oTable3.SetWidth("percent", 100);
oTable3.SetStyle(oTableStyle);
oDocument.Push(oTable3);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Caption with bExludeLabel: true and nHeadingLvl: 1");
oCell = oTable3.GetCell(0,0);
oTable3.AddElement(oCell, 0, oParagraph);
oTable3.AddCaption(" caption text", "", true, "ALPHABETIC", false, 1, "colon");

var oTable4 = Api.CreateTable(3, 3);
oTable4.SetWidth("percent", 100);
oTable4.SetStyle(oTableStyle);
oDocument.Push(oTable4);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Caption with bBefore: true and nHeadingLvl: 2");
oCell = oTable4.GetCell(0,0);
oTable4.AddElement(oCell, 0, oParagraph);
oTable4.AddCaption("", "Equation", false, "alphabetic", true, 2, "dash");

var oTable5 = Api.CreateTable(3, 3);
oTable5.SetWidth("percent", 100);
oTable5.SetStyle(oTableStyle);
oDocument.Push(oTable5);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Caption with nHeadingLvl: 3");
oCell = oTable5.GetCell(0,0);
oTable5.AddElement(oCell, 0, oParagraph);
oTable5.AddCaption("", "", false, "Roman", false, 3, "longDash");

builder.SaveFile("docx", "AddCaption.docx");
builder.CloseFile();

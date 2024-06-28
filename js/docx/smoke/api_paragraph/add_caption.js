builder.CreateFile("docx");
var oDocument= Api.GetDocument();
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

var oParagraph1 = oDocument.GetElement(0);
oParagraph1.AddText("Caption without parameters");
oParagraph1.AddCaption();

var oParagraph2 = Api.CreateParagraph();
oParagraph2.AddText("Caption with additional text");
oDocument.Push(oParagraph2);
oParagraph2.AddCaption(' caption text', "Figure", false, "Arabic", false, null, "period");

var oParagraph3 = Api.CreateParagraph();
oParagraph3.AddText("Caption with bExludeLabel: true and nHeadingLvl: 1");
oDocument.Push(oParagraph3);
oParagraph3.AddCaption(" caption text", "", true, "ALPHABETIC", false, 1, "colon");

var oParagraph4 = Api.CreateParagraph();
oParagraph4.AddText("Caption with bBefore: true and nHeadingLvl: 2");
oDocument.Push(oParagraph4);
oParagraph4.AddCaption("", "Equation", false, "alphabetic", true, 2, "dash");

var oParagraph5 = Api.CreateParagraph();
oParagraph5.AddText("Caption with nHeadingLvl: 3");
oDocument.Push(oParagraph5);
oParagraph5.AddCaption("", "", false, "Roman", false, 3, "longDash");

builder.SaveFile("docx", "AddCaption.docx");
builder.CloseFile();
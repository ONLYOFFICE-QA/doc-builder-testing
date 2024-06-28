builder.CreateFile("docx");
var oDocument= Api.GetDocument();

var oParagraph1 = oDocument.GetElement(0);
oParagraph1.AddText("Caption without parameters");
oParagraph1.AddCaption();

var oParagraph2 = Api.CreateParagraph();
oParagraph2.AddText("Caption with additional text");
oDocument.Push(oParagraph2);
oParagraph2.AddCaption(' caption text', "Figure", false, "roman", false, null, "dash");

var oParagraph3 = Api.CreateParagraph();
oParagraph3.AddText("Caption with bExludeLabel: true");
oDocument.Push(oParagraph3);
oParagraph3.AddCaption(" caption text", "Equation", true, "ALPHABETIC", false, null, "colon");

var oParagraph4 = Api.CreateParagraph();
oParagraph4.AddText("Caption with bBefore: true");
oDocument.Push(oParagraph4);
oParagraph4.AddCaption("", "Equation", false, "alphabetic", true, null, "period");

builder.SaveFile("docx", "AddCaption.docx");
builder.CloseFile();
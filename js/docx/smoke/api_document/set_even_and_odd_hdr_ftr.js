builder.CreateFile("docx");
var oDocument = Api.GetDocument();

var oParagraph1 = oDocument.GetElement(0);
var oSection = oDocument.CreateSection(oParagraph1);
oParagraph1.AddText("This is section #1 of the document. ");
oParagraph1.AddText("It has a header and a footer for odd pages. ");
oParagraph1.AddText("Scroll down to see the other pages.");
var oHeader1 = oSection.GetHeader("default", true);

var oParagraphInHeader = oHeader1.GetElement(0);
oParagraphInHeader.AddText("This is an odd page header");

var oFooter = oSection.GetFooter("default", true);
var oParagraphInSection = oFooter.GetElement(0);
oParagraphInSection.AddText("This is an odd page footer");
oDocument.SetEvenAndOddHdrFtr(true);

var oParagraph2 = Api.CreateParagraph();
oDocument.Push(oParagraph2);
var oSection2 = oDocument.CreateSection(oParagraph2);
oSection2.SetType("evenPage");
oParagraph2.AddText("This is section #2 of the document. ");
oParagraph2.AddText("It has a header and a footer for even pages. ");
oParagraph2.AddText("Scroll down to see the other pages.");

var oHeader2 = oSection.GetHeader("even", true);
var oParagraphInHeader2 = oHeader2.GetElement(0);
oParagraphInHeader2.AddText("This is an even page header");
var oFooter2 = oSection.GetFooter("even", true);
var oParagraphInFooter2 = oFooter2.GetElement(0);
oParagraphInFooter2.AddText("This is an even page footer");

var oParagraph3 = Api.CreateParagraph();
oDocument.Push(oParagraph3);
var oSection3 = oDocument.CreateSection(oParagraph3);
oSection3.SetType("oddPage");
oParagraph3.AddText("This is section #3 of the document. ");
oParagraph3.AddText("It has a header and a footer for odd pages. ");
oParagraph3.AddText("Scroll down to see the other pages.");

var oSection4 = oDocument.GetFinalSection();
oSection4.SetType("evenPage");
var oParagraph4 = Api.CreateParagraph();
oParagraph4.AddText("This is section #4 of the document. ");
oParagraph4.AddText("It has a header and a footer for even pages.");
oDocument.Push(oParagraph4);

builder.SaveFile("docx", "SetEvenAndOddHdrFtr.docx");
builder.CloseFile();

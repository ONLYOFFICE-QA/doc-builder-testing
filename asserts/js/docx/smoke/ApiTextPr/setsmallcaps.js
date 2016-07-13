builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetSmallCaps(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the font set to small capitalized letters.");
builder.SaveFile("docx", "SetSmallCaps.docx");
builder.CloseFile();

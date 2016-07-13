builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetVertAlign("subscript");
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text aligned below the baseline vertically.");
builder.SaveFile("docx", "SetVertAlign.docx");
builder.CloseFile();

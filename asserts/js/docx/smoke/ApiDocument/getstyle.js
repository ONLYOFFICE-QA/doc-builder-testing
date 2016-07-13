builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
var oNoSpacingStyle = oDocument.GetStyle("Heading 6");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oNoSpacingStyle);
oParagraph.AddText("This is a text in a paragraph styled with the 'Heading 6' style.");
builder.SaveFile("docx", "ApiDocument.docx");
builder.CloseFile();

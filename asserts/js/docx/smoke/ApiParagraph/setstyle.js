builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
var oNewDocumentStyle = oDocument.GetStyle("Heading 6");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oNewDocumentStyle);
oParagraph.AddText("This is a text in a paragraph styled with the 'Heading 6' style.");
builder.SaveFile("docx", "SetStyle.docx");
builder.CloseFile();

builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is just a sample text. Nothing special.");
builder.SaveFile("docx", "AddText.docx");
builder.CloseFile();

builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a new paragraph");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetDocument.docx");
builder.CloseFile();

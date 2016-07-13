builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oGs1, oGs2, oFill, oStroke, oDrawing, oParagraph;
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a new paragraph");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "CreateParagraph.docx");
builder.CloseFile();
            
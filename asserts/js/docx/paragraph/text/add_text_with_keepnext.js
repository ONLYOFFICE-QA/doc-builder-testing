builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oParagraph = Api.CreateParagraph();
oParagraph.SetKeepNext(true);
oParagraph.AddText("KeepNext");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "add_text_with_keepnext.docx");
builder.CloseFile();

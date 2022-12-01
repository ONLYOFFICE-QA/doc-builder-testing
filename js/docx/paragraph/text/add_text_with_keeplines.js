builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oParagraph = Api.CreateParagraph();
oParagraph.SetKeepLines(true);
oParagraph.AddText("KeepLines");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "add_text_with_keeplines.docx");
builder.CloseFile();

builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.AddText("test");
builder.SaveFile("docx", "add_text_in_paragraph.docx");
builder.CloseFile();

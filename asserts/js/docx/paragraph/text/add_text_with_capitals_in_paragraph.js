builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.AddText("Capitals").SetCaps(true);
builder.SaveFile("docx", "add_text_with_capitals_in_paragraph.docx");
builder.CloseFile();
builder.CloseFile();

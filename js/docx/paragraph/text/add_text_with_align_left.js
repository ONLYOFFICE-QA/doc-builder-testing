builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oParagraph = Api.CreateParagraph();
oParagraph.SetJc("left");
oParagraph.AddText("paragraph align: left");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "add_text_with_align_left.docx");
builder.CloseFile();

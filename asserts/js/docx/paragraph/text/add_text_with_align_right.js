builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oParagraph = Api.CreateParagraph();
oParagraph.SetJc("right");
oParagraph.AddText("paragraph align: right");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "add_text_with_align_right.docx");
builder.CloseFile();

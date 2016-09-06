builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oParagraph = Api.CreateParagraph();
oParagraph.SetJc("center");
oParagraph.AddText("paragraph align: center");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "add_text_with_align_center.docx");
builder.CloseFile();
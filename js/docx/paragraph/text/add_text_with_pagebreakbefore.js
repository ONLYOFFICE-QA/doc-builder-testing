builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oParagraph = Api.CreateParagraph();
oParagraph.SetPageBreakBefore(true);
oParagraph.AddText("PageBreakBefore");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "add_text_with_pagebreakbefore.docx");
builder.CloseFile();

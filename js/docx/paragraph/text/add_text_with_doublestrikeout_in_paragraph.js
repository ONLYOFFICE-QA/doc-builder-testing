builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.AddText("DoubleStrikeout").SetDoubleStrikeout(true);
builder.SaveFile("docx", "add_text_with_doublestrikeout_in_paragraph.docx");
builder.CloseFile();
builder.CloseFile();

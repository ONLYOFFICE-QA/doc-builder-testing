builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oParagraph = Api.CreateParagraph();
oParagraph.SetIndFirstLine(-100);
oParagraph.AddText("First line indent is 5pt");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "add_text_with_firstline_minus.docx");
builder.CloseFile();

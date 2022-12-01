builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingLine(400, "atLeast");
oParagraph.AddText("Atleast:20pt");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "add_text_with_spacingline_atleast.docx");
builder.CloseFile();

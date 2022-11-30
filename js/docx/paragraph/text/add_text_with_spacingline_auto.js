builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingLine(3 * 240, "auto");
oParagraph.AddText("Auto:3");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "add_text_with_spacingline_auto.docx");
builder.CloseFile();

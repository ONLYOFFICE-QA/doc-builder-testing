builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.AddText("Superscript").SetVertAlign("superscript");
builder.SaveFile("docx", "add_text_with_superscript_in_paragraph.docx");
builder.CloseFile();

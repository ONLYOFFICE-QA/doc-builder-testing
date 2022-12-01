builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
 var oParagraph = Api.CreateParagraph();
 oParagraph.SetIndRight(1000);
 oParagraph.AddText("RightIndent");
 oDocument.Push(oParagraph);
builder.SaveFile("docx", "add_text_with_indentright.docx");
builder.CloseFile();

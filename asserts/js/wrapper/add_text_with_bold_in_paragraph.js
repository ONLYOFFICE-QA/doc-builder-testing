builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.AddText("Bold").SetBold(true);
builder.SaveFile("docx", "/tmp/docbuilder-testsing/add_text_with_bold_in_paragraph.docx");
builder.CloseFile();
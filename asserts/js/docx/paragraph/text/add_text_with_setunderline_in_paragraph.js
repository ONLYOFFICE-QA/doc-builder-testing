builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.AddText("Underline").SetUnderline(true);

builder.SaveFile("docx", "add_text_with_setunderline_in_paragraph.docx");
builder.CloseFile();

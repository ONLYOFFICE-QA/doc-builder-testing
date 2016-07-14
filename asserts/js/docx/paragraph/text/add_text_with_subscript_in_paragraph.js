builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.AddText("Subscript").SetVertAlign("subscript");

builder.SaveFile("docx", "add_text_with_subscript_in_paragraph.docx");
builder.CloseFile();

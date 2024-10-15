builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is text for check ");
var oRun = oParagraph.AddText("GetCurrentWord");
oRun.MoveCursorToPos(6);

oParagraph = Api.CreateParagraph();
oParagraph.AddText("word is " + oDocument.GetCurrentWord());
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("before cursor: " + oDocument.GetCurrentWord("before"));
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("after cursor: " + oDocument.GetCurrentWord("after"));
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetCurrentWord.docx");
builder.CloseFile();

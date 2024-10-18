builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oRun = oParagraph.AddText("This is text. For check GetCurrentSentence. Just sentence.");
oRun.MoveCursorToPos(24);

oParagraph = Api.CreateParagraph();
oParagraph.AddText("sentence is " + oDocument.GetCurrentSentence());
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("before cursor: " + oDocument.GetCurrentSentence("before"));
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("after cursor: " + oDocument.GetCurrentSentence("after"));
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetCurrentSentence.docx");
builder.CloseFile();

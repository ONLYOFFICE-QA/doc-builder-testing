builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oRun = oParagraph.AddText("This is text. FOR CHECK. GetCurrentSentence");

oRun.MoveCursorToPos(20);
oDocument.ReplaceCurrentSentence("for check. ");

oRun.MoveCursorToPos(32);
oDocument.ReplaceCurrentSentence("Replace current ", "before");
oDocument.ReplaceCurrentSentence("sentence", "after");
builder.SaveFile("docx", "ReplaceCurrentWord.docx");
builder.CloseFile();

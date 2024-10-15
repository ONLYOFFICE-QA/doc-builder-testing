builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is text for check ");
var oRun1 = oParagraph.AddText("REPLACE ");
var oRun2 = oParagraph.AddText("CURRENTWORD");

oRun1.MoveCursorToPos(1);
oDocument.ReplaceCurrentWord("replace");

oRun2.MoveCursorToPos(7);
oDocument.ReplaceCurrentWord("current", "before");
oDocument.ReplaceCurrentWord(" word", "after");
builder.SaveFile("docx", "ReplaceCurrentWord.docx");
builder.CloseFile();

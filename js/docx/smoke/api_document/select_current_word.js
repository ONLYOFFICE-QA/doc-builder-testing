builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oRun1 = oParagraph.AddText("This is text for check SelectCurrentWord");

oRun1.MoveCursorToPos(25);
oDocument.SelectCurrentWord();
oParagraph = Api.CreateParagraph();
oParagraph.AddText("selected text is " + oDocument.GetRangeBySelect().GetText());
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SelectCurrentWord.docx");
builder.CloseFile();

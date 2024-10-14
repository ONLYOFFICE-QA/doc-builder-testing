builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText('This is text for check ');
var oRun1 = oParagraph.AddText('REPLACE ');
var oRun2 = oParagraph.AddText('CuRrEnTwOrD');

oRun1.MoveCursorToPos(1);
oDocument.ReplaceCurrentWord('Replace');

oRun2.MoveCursorToPos(7);
oDocument.ReplaceCurrentWord('Current', 'before');
oDocument.ReplaceCurrentWord('Word', 'after');
builder.SaveFile("docx", "ReplaceCurrentWord.docx");
builder.CloseFile();
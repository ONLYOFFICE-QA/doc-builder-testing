builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oRun = oParagraph.AddText('This is text for check SetEndPos');

oParagraph = Api.CreateParagraph();
var oRange = oRun.GetRange();
oRange.SetEndPos(oRange.GetEndPos() - 7);
oParagraph.AddText('Run end pos = ' + oRange.GetEndPos());
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetEndPos.docx");
builder.CloseFile();

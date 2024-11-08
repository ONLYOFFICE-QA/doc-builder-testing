builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oRun = oParagraph.AddText('This is text for check SetStartPos');

oParagraph = Api.CreateParagraph();
var oRange = oRun.GetRange();
oRange.SetStartPos(oRange.GetStartPos() + 5);
oParagraph.AddText('Run start pos = ' + oRange.GetStartPos());
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetStartPos.docx");
builder.CloseFile();

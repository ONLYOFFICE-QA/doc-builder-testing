builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oRun1 = oParagraph.AddText('This is text');
var oRun2 = oParagraph.AddText(' for check GetStartPos');
oParagraph.AddLineBreak();
var oRun3 = oParagraph.AddText('Another text');

oParagraph = Api.CreateParagraph();
oParagraph.AddText('Run1 start pos = ' + oRun1.GetRange().GetStartPos());
oParagraph.AddLineBreak();
oParagraph.AddText('Run2 start pos = ' + oRun2.GetRange().GetStartPos());
oParagraph.AddLineBreak();
oParagraph.AddText('Run3 start pos = ' + oRun3.GetRange().GetStartPos());
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetStartPos.docx");
builder.CloseFile();

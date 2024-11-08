builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oRun1 = oParagraph.AddText('This is text ');
var oRun2 = oParagraph.AddText('for check GetEndPos');
oParagraph.AddLineBreak();
var oRun3 = oParagraph.AddText('Another text');

oParagraph = Api.CreateParagraph();
oParagraph.AddText('Run1 end pos = ' + oRun1.GetRange().GetEndPos());
oParagraph.AddLineBreak();
oParagraph.AddText('Run2 end pos = ' + oRun2.GetRange().GetEndPos());
oParagraph.AddLineBreak();
oParagraph.AddText('Run3 end pos = ' + oRun3.GetRange().GetEndPos());
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetEndPos.docx");
builder.CloseFile();

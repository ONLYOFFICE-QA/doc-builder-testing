builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph0, oParagraph;
oParagraph0 = oDocument.GetElement(0);
oParagraph0.AddText("This is paragraph #1.");
var oParaNum;
for (var nParaIncrease = 0; nParaIncrease < 4; ++nParaIncrease)
{
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is paragraph #" + (nParaIncrease + 2) + ".");
oDocument.Push(oParagraph);
}
oDocument.RemoveElement(2);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("We removed paragraph #3, check that out above.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "RemoveElement.docx");
builder.CloseFile();

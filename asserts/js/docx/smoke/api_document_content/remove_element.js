builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oStroke, oFill, oDocContent;
oParagraph = oDocument.GetElement(0);
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 3212465, 1926590, oFill, oStroke);
oParagraph.AddDrawing(oDrawing);
oDocContent = oDrawing.GetDocContent();
oDocContent.RemoveAllElements();
for (var nParaIncrease = 0; nParaIncrease < 5; ++nParaIncrease)
{
    oParagraph = Api.CreateParagraph();
    oParagraph.AddText("This is paragraph #" + (nParaIncrease + 1) + ".");
    oDocContent.Push(oParagraph);
}
oDocContent.RemoveElement(3);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("We removed paragraph #3, check that out above.");
oDocContent.Push(oParagraph);
builder.SaveFile("docx", "RemoveElement.docx");
builder.CloseFile();
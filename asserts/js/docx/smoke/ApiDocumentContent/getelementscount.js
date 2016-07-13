builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = Api.CreateParagraph();
oRun = Api.CreateRun();
oRun.AddText("Number of paragraph elements at this point: ");
oRun.AddTabStop();
oRun.AddText("" + oParagraph.GetElementsCount());
oRun.AddLineBreak();
oParagraph.AddElement(oRun);
oRun.AddText("Number of paragraph elements after we added a text run: ");
oRun.AddTabStop();
oRun.AddText("" + oParagraph.GetElementsCount());
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetElementsCount.docx");
builder.CloseFile();
            
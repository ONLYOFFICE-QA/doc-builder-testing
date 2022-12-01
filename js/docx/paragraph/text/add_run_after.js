builder.CreateFile("docx");
var oDocument, oParagraph, oRun;
oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oRun = Api.CreateRun();
oParagraph.AddElement(oRun);
oRun.AddText("Run");
oRun.AddTabStop();
oRun.AddText("StopRun");
builder.SaveFile("docx", "add_run_after.docx");
builder.CloseFile();


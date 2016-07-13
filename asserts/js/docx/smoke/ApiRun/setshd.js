builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetShd("clear", 0, 255, 0);
oRun.AddText("This is a text run with the text shading set to green.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetShd.docx");
builder.CloseFile();
            
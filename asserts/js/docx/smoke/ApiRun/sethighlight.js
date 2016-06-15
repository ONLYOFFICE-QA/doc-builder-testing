
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetHighlight(255, 255, 0);
oRun.AddText("This is a text run with the text highlighted with yellow color.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetHighlight.docx");
builder.CloseFile();
            
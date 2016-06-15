
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is the text for a text run. Nothing special.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "AddElement.docx");
builder.CloseFile();
            
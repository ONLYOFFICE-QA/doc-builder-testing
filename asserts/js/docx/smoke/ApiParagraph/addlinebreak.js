builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = oParagraph.AddText("This is the text for the first line. Nothing special.");
oParagraph.AddLineBreak();
oRun = oParagraph.AddText("This is the text which starts from the beginning of the second line. ");
oRun = oParagraph.AddText("It is written in two text runs, you need a space at the end of the first run sentence to separate them.");
builder.SaveFile("docx", "ApiParagraph.docx");
builder.CloseFile();
            
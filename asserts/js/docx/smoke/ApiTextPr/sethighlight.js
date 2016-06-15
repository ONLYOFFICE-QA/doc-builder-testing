
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetHighlight(255, 255, 0, false);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text highlighted with yellow color using the text properties.");
builder.SaveFile("docx", "SetHighlight.docx");
builder.CloseFile();
            

            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetColor(0, 0, 255, false);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the color set to blue using the text properties.");
builder.SaveFile("docx", "SetColor.docx");
builder.CloseFile();
            
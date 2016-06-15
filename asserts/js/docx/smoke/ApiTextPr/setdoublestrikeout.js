
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetDoubleStrikeout(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text struck out with two lines using the text properties.");
builder.SaveFile("docx", "SetDoubleStrikeout.docx");
builder.CloseFile();
            
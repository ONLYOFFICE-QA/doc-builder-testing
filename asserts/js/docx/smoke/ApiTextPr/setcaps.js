builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetCaps(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text set to capital letters using the text properties.");
builder.SaveFile("docx", "SetCaps.docx");
builder.CloseFile();
            
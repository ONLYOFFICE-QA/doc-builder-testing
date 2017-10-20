builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetPosition(10);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text raised 5 points (10 half-points) above the baseline using the text properties.");
builder.SaveFile("docx", "SetPosition.docx");
builder.CloseFile();

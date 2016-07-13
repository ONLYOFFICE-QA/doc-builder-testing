builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oParagraph, oDrawing;
oParagraph = oDocument.GetElement(0);
builder.SaveFile("docx", "ApiTableStylePr.docx");
builder.CloseFile();

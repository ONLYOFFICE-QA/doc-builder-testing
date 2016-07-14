builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oDrawing;
oParagraph = oDocument.GetElement(0);
builder.SaveFile("docx", "ApiNumberingLevel.docx");
builder.CloseFile();

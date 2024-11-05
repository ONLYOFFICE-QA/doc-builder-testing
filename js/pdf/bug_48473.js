builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oParagraph = oDocument.GetElement(0);
oDrawing = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("pdf", "script.pdf");
builder.CloseFile();

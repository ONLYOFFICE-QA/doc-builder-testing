builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oParagraph = oDocument.GetElement(0);
oDrawing = Api.CreateImage("https://static.onlyoffice.com/assets/docs/samples/img/presentation_sky.png", 60 * 36000, 35 * 36000);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("pdf", "script.pdf");
builder.CloseFile();

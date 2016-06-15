
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oDrawing;
oParagraph = oDocument.GetElement(0);
oDrawing = Api.CreateImage("http://helpcenter.onlyoffice.com/images/help/video/coordinate_aspects.png", 60 * 36000, 35 * 36000);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "CreateImage.docx");
builder.CloseFile();
                        
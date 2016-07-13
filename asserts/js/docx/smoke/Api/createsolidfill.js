builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oFill, oStroke, oDrawing, oParagraph, oRGBColor;
oParagraph = oDocument.GetElement(0);
oRGBColor = Api.CreateRGBColor(0, 255, 0);
oFill = Api.CreateSolidFill(oRGBColor);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("roundRect", 5930900, 395605, oFill, oStroke);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "CreateSolidFill.docx");
builder.CloseFile();
                        
builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oFill, oStroke, oDrawing, oParagraph;
oParagraph = oDocument.GetElement(0);
oFill = Api.CreateBlipFill("http://helpcenter.onlyoffice.com/images/icons/icon_DocumentEditors.png", "tile");
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("star10", 5930900, 595605, oFill, oStroke);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "CreateBlipFill.docx");
builder.CloseFile();
            
builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oSlide.Select();
var oDrawing = Api.CreateImage(
    "https://legacy-api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png",
    300 * 36000,
    150 * 36000
);
oSlide.AddObject(oDrawing);
oDrawing.Select();

var oSelection = Api.GetSelection();
var aShapes = oSelection.GetShapes();
var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("Shapes length: " + aShapes.length + ", type: " + aShapes[0].GetClassType());
oParagraph.SetHighlight("black");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetShapes.pptx");
builder.CloseFile();

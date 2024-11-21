builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oDrawing = Api.CreateImage(
    "https://legacy-api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png",
    300 * 36000,
    150 * 36000
);
oSlide.AddObject(oDrawing);
oDrawing.Select();
builder.SaveFile("pptx", "Select.pptx");
builder.CloseFile();

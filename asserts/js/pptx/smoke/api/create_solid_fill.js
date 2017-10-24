builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oRGBColor = Api.CreateRGBColor(0, 255, 0);
oFill = Api.CreateSolidFill(oRGBColor);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateSolidFill.pptx");
builder.CloseFile();

builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oFill = Api.CreateBlipFill("https://static.onlyoffice.com/assets/docs/samples/img/onlyoffice_logo.png", "tile");
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateBlipFill.pptx");
builder.CloseFile();

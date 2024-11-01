builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oFill = Api.CreateBlipFill("https://legacy-api.onlyoffice.com/content/img/docbuilder/examples/icon_DocumentEditors.png", "tile");
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateBlipFill.pptx");
builder.CloseFile();

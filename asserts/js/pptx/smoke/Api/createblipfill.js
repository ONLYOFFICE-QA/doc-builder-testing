builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oFill = Api.CreateBlipFill("http://helpcenter.onlyoffice.com/images/icons/icon_DocumentEditors.png", "tile");
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateBlipFill.pptx");
builder.CloseFile();

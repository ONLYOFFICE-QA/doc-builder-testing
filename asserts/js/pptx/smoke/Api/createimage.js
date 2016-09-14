builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oShape = Api.CreateImage("http://helpcenter.onlyoffice.com/images/Help/Guides/big/guide59/step2_1.png", 300 * 36000, 150 * 36000);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "CreateImage.pptx");
builder.CloseFile();

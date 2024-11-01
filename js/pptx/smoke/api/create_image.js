builder.CreateFile("pptx");
    var oPresentation = Api.GetPresentation();
    var oSlide = oPresentation.GetSlideByIndex(0);
    oSlide.RemoveAllObjects();
    var oShape = Api.CreateImage("https://legacy-api.onlyoffice.com/content/img/docbuilder/examples/step2_1.png", 300 * 36000, 150 * 36000);
    oSlide.AddObject(oShape);
builder.SaveFile("pptx", "CreateImage.pptx");
builder.CloseFile();

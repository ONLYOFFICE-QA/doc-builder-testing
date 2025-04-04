builder.CreateFile("pptx");
    var oPresentation = Api.GetPresentation();
    var oSlide = oPresentation.GetSlideByIndex(0);
    var oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
    var oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
    var oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
        oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "GetSlideByIndex.pptx");
builder.CloseFile();

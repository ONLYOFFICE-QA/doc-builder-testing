builder.CreateFile("pptx");
    var oPresentation = Api.GetPresentation();
    var oSlide = Api.CreateSlide();
    var oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
    var oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
    var oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
    oSlide.SetBackground(oFill);
    oPresentation.AddSlide(oSlide);

    oPresentation.GetSlideByIndex(0)
                    .GetAllDrawings()[0]
                    .GetContent()
                    .GetElement(0)
                    .AddText("length: " + oPresentation.GetAllSlides().length)

    var json  = oPresentation
                    .GetAllSlides()[1]
                    .ToJSON(true, true, true, true)

        oPresentation.GetSlideByIndex(0)
                    .GetAllDrawings()[1]
                    .GetContent()
                    .GetElement(0)
                    .AddText(json)
builder.SaveFile("pptx", "GetAllSlides.pptx");
builder.CloseFile();

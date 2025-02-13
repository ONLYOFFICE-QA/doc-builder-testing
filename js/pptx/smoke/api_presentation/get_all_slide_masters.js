builder.CreateFile("pptx");
    var oPresentation = Api.GetPresentation();
    var oSlide = oPresentation.GetSlideByIndex(0);
    var oClrScheme = Api.CreateThemeColorScheme([Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51), Api.CreateRGBColor(230, 179, 117), Api.CreateRGBColor(235, 235, 235), Api.CreateRGBColor(163, 21, 21),
        Api.CreateRGBColor(128, 43, 43), Api.CreateRGBColor(0, 0, 0), Api.CreateRGBColor(128, 128, 128), Api.CreateRGBColor(176, 196, 222), Api.CreateRGBColor(65, 105, 225), Api.CreateRGBColor(255, 255, 255), Api.CreateRGBColor(255, 213, 191)], "New color scheme");
    var oTheme = oSlide.GetTheme();
    oTheme.SetColorScheme(oClrScheme);
    var oMaster = Api.CreateMaster(oTheme);
    var nCountBefore = oPresentation.GetMastersCount();
        oPresentation.AddMaster(nCountBefore, oMaster);
    var oParagraph = oPresentation.GetSlideByIndex(0)
                                    .GetAllDrawings()[0]
                                    .GetContent()
                                    .GetElement(0)
        oParagraph.AddText("master count: " + oPresentation.GetMastersCount())
        oParagraph.AddLineBreak();
        oParagraph.AddText("array slide masters: " + oPresentation.GetAllSlideMasters().length)
builder.SaveFile("pptx", "GetAllSlideMasters.pptx");
builder.CloseFile();

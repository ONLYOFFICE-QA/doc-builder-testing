builder.CreateFile("pptx");
    var oPresentation = Api.GetPresentation();
    var oSlide = oPresentation.GetSlideByIndex(0);
        oSlide.Select()
    var oSelection = Api.GetSelection()
        oPresentation.GetSlideByIndex(0)
            .GetAllDrawings()[0]
            .GetContent()
            .GetElement(0)
            .AddText("is empty: " + oSelection.IsEmpty())
builder.SaveFile("pptx", "Select.pptx");
builder.CloseFile();

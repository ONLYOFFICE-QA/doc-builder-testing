builder.CreateFile("pptx");
    var oPresentation = Api.GetPresentation();
    var oSlide = oPresentation.GetSlideByIndex(0);
        oSlide.RemoveAllObjects();
    oSlide.AddComment(0, 0, "This is a comment.", "John Smith");
    oSlide.AddComment(10 * 36000, 20 * 36000, "This is another comment.", "Mark Potato");
    var oShape = Api.CreateShape("rect", 300 * 36000, 130 * 36000);
    var oDocContent = oShape.GetDocContent();
    var oParagraph = oDocContent.GetElement(0);

    var arrComments = oPresentation.GetAllComments();
    var commentsArray = [];
    for (var i=0; i<arrComments.length; i++) {
        commentsArray.push(arrComments[i].GetText());
    }
        oParagraph.AddText(commentsArray.join(", "));
        oParagraph.SetHighlight("lightGray");
        oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetAllComments.pptx");
builder.CloseFile();

builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var oParagraph = oDocument.GetElement(0);
    var oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
    var oStroke = Api.CreateStroke(0, Api.CreateNoFill());
    var oDrawing = Api.CreateShape("rect", 3212465, 963295, oFill, oStroke);
        oParagraph.AddDrawing(oDrawing);
    var oDocContent = oDrawing.GetDocContent();
        oParagraph = oDocContent.GetElement(0);
        oParagraph.AddText("Simple text");
    var json = oDocContent.ToJSON(true, true);
GlobalVariable["JSON"] = json;
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
    var json = GlobalVariable["JSON"]
    var oDocContentFromJSON = Api.FromJSON(json);
        Api.ReplaceDocumentContent(oDocContentFromJSON);
    var oDocument = Api.GetDocument();
    var oParagraph = Api.CreateParagraph();
        oParagraph.AddText(json);
        oDocument.Push(oParagraph);
builder.SaveFile("docx", "ParagraphToJSON.docx");
builder.CloseFile();

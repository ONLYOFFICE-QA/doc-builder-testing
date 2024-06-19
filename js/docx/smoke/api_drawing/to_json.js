builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
    var oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
    var oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);
    var oStroke = Api.CreateStroke(0, Api.CreateNoFill());
    var oDrawing = Api.CreateShape("rect", 5930900, 395605, oFill, oStroke);
    var json = oDrawing.ToJSON(true, true);
GlobalVariable["JSON"] = json;
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
    var json = GlobalVariable["JSON"]
    var oDocument = Api.GetDocument();
    var oParagraph = oDocument.GetElement(0);
        oParagraph.AddText(json);
        oDocument.Push(oParagraph);
    var oDrawingFromJSON = Api.FromJSON(json)
        oParagraph = Api.CreateParagraph();
        oParagraph.AddDrawing(oDrawingFromJSON);
        oDocument.Push(oParagraph);
builder.SaveFile("docx", "ToJSON.docx");
builder.CloseFile();

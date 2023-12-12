builder.CreateFile("docx");
    let oDocument = Api.GetDocument();
    let oParagraph = oDocument.GetElement(0);
    let oRGBColor = Api.CreateRGBColor(255, 111, 61);
    let oStroke = Api.CreateStroke(5 * 36000, Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51)));
    let jsonStroke = oStroke.ToJSON();
        oParagraph.AddText(jsonStroke);
        GlobalVariable["JSON_Stroke"] = jsonStroke;
builder.CloseFile();

//////////////////////

builder.CreateFile("docx");
    let oDocument = Api.GetDocument();
    let oParagraph = oDocument.GetElement(0);
    let jsonStroke = GlobalVariable["JSON_Stroke"];
    let oRGBColor2 = Api.CreateRGBColor(255, 213, 191);
    let oFill = Api.CreateSolidFill(oRGBColor2);
    let oStrokeFromJSON = Api.FromJSON(jsonStroke);
    let oDrawing = Api.CreateShape("roundRect", 5930900, 395605, oFill, oStrokeFromJSON);
        oParagraph.AddDrawing(oDrawing);
    let oParagraph2 = Api.CreateParagraph();
    let jsonDrawing = oDrawing.ToJSON(false, true);
        oParagraph2.AddText(jsonDrawing);
        oDocument.Push(oParagraph2);
builder.SaveFile("docx", "StrokeToJson.docx");
builder.CloseFile();


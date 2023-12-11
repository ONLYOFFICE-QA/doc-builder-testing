builder.CreateFile("docx");
    let oDocument = Api.GetDocument();
    let oParagraph = oDocument.GetElement(0);
// Using an RGBColor instance is valid for testing UniColor.
// This information is directly from the developer.
    let oRGBColor = Api.CreateRGBColor(255, 111, 61);
    let oFill = Api.CreateSolidFill(oRGBColor);
        oParagraph.AddText(oFill.ToJSON());
        GlobalVariable["JSON_UniColor"] = oFill.ToJSON();
builder.CloseFile();

/////////////////////

builder.CreateFile("docx");
    let oDocument = Api.GetDocument();
    let oParagraph = oDocument.GetElement(0);
    let jsonSolidFill = GlobalVariable["JSON_UniColor"];
    let oFillRestored = Api.FromJSON(jsonSolidFill);
    let oStroke = Api.CreateStroke(0, Api.CreateNoFill());
    let oDrawing = Api.CreateShape("rect", 5930900, 395605, oFillRestored, oStroke);
    let jsonDrawing = oDrawing.ToJSON(false, true);
        oParagraph.AddText(jsonDrawing);
        oDocument.Push(oParagraph);
builder.SaveFile("docx", "UnicolorToJson.docx");
builder.CloseFile();

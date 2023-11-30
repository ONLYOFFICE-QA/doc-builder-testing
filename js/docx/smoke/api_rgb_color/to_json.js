builder.CreateFile("docx");
    let oDocument = Api.GetDocument();
    let oParagraph = oDocument.GetElement(0);
    let oRGBColor = Api.CreateRGBColor(255, 111, 61);
    let jsonRGBColor = oRGBColor.ToJSON();
        oParagraph.AddText(jsonRGBColor);
        GlobalVariable["JSON_RGBColor"] = jsonRGBColor;
builder.CloseFile();

/////////////////////

builder.CreateFile("docx");
    let oDocument = Api.GetDocument();
    let oParagraph1 = oDocument.GetElement(0);
    let jsonRGBColor = GlobalVariable["JSON_RGBColor"];
    let oRGBColor = Api.FromJSON(jsonRGBColor);
        oParagraph1.AddText(jsonRGBColor);
        oDocument.Push(oParagraph1);
    let oParagraph2 = Api.CreateParagraph();
    let oGs1 = Api.CreateGradientStop(oRGBColor, 0);
    let oGs2 = Api.CreateGradientStop(oRGBColor, 10);
    let oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);
    let oStroke = Api.CreateStroke(0, Api.CreateNoFill());
    let oDrawing = Api.CreateShape("rect", 5930900, 395605, oFill, oStroke);
    let jsonDrawing = oDrawing.ToJSON(false, true);
        oParagraph2.AddText(jsonDrawing);
        oDocument.Push(oParagraph2);
builder.SaveFile("docx", "RGBCoolorToJson.docx");
builder.CloseFile();



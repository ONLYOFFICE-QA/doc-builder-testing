builder.CreateFile("docx");
    let oDocument = Api.GetDocument();
    let oParagraph = oDocument.GetElement(0);
    let oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 0);
    let oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 100000);
    let oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
    let jsonFill = oFill.ToJSON();
        oParagraph.AddText(jsonFill);
        GlobalVariable["JSON_Fill"] = jsonFill;
builder.CloseFile();

//////////////////////

builder.CreateFile("docx");
    let oDocument = Api.GetDocument();
    let oParagraph1 = oDocument.GetElement(0);
    let jsonFill = GlobalVariable["JSON_Fill"];
    let oFill = Api.FromJSON(jsonFill);
        oParagraph1.AddText(jsonFill);
        oDocument.Push(oParagraph1);
    let oParagraph2 = Api.CreateParagraph();
    let oStroke = Api.CreateStroke(0, Api.CreateNoFill());
    let oDrawing = Api.CreateShape("rect", 1908000, 1404000, oFill, oStroke);
        oDrawing.Fill(oFill);
    let jsonDrawing = oDrawing.ToJSON(false, true);
        oParagraph2.AddText(jsonDrawing);
        oDocument.Push(oParagraph2);
builder.SaveFile("docx", "FillToJson.docx");
builder.CloseFile();

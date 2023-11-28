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
    let oNewDocument = Api.GetDocument();
    let jsonRGBColor = GlobalVariable["JSON_RGBColor"];
    let oParagraphRGBColor = oNewDocument.GetElement(0);
        oParagraphRGBColor.AddText(jsonRGBColor);
    let oRGBColorFromJSON = Api.FromJSON(jsonRGBColor);
    let oParagraphRGBColorObject = Api.CreateParagraph();
        oNewDocument.Push(oParagraphRGBColorObject);
    let bWriteNumberings = false;
    let bWriteStyles = true;
    let jsonDrawingFromJSON = oRGBColorFromJSON.ToJSON(bWriteNumberings, bWriteStyles);
    let oParagraphDrawing = Api.CreateParagraph();
        oParagraphDrawing.AddText(jsonDrawingFromJSON);
        oNewDocument.Push(oParagraphDrawing);
builder.SaveFile("docx", "RGBColorToJSON.docx");
builder.CloseFile();

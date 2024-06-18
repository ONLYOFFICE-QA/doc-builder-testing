builder.CreateFile("docx");
    var oSchemeColor = Api.CreateSchemeColor("w");
    var json = oSchemeColor.ToJSON();
GlobalVariable["JSON"] = json;
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
    var json = GlobalVariable["JSON"]
    var oDocument = Api.GetDocument();
    var oSchemeColorFromJSON = Api.FromJSON(json);
    var sClassType = oSchemeColorFromJSON.GetClassType();
    var oParagraph = oDocument.GetElement(0);
        oParagraph.AddText(sClassType);
        oDocument.Push(oParagraph)
        oParagraph = Api.CreateParagraph();
        oParagraph.AddText(json);
        oDocument.Push(oParagraph)
    var oFill = Api.CreateSolidFill(oSchemeColorFromJSON);
    var oStroke = Api.CreateStroke(0, Api.CreateNoFill());
    var oDrawing = Api.CreateShape("curvedUpArrow", 5930900, 595605, oFill, oStroke);
        oParagraph = Api.CreateParagraph();
        oParagraph.AddDrawing(oDrawing);
        oDocument.Push(oParagraph)
builder.SaveFile("docx", "ToJSON.docx");
builder.CloseFile();

builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var oParagraph = oDocument.GetElement(0);
    var oPresetColor = Api.CreatePresetColor("peachPuff");
    var json = oPresetColor.ToJSON();
GlobalVariable["JSON"] = json;
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
var json = GlobalVariable["JSON"]
    var oDocument = Api.GetDocument();
    var oPresetColorFromJSON = Api.FromJSON(json);
    var oParagraph = oDocument.GetElement(0);
    var sClassType = oPresetColorFromJSON.GetClassType();
        oParagraph.AddText(sClassType);
        oDocument.Push(oParagraph)
        oParagraph = Api.CreateParagraph();
        oParagraph.AddText(json);
        oDocument.Push(oParagraph)
    var oGs1 = Api.CreateGradientStop(oPresetColorFromJSON, 0);
    var oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000);
    var oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
    var oStroke = Api.CreateStroke(0, Api.CreateNoFill());
    var oDrawing = Api.CreateShape("rect", 5930900, 395605, oFill, oStroke);
        oParagraph = Api.CreateParagraph();
        oParagraph.AddDrawing(oDrawing);
        oDocument.Push(oParagraph);
builder.SaveFile("docx", "ToJSON.docx");
builder.CloseFile();

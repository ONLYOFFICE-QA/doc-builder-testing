 builder.CreateFile("docx");
    var oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 0);
    var oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 100000);
        GlobalVariable["json"] = {
            start: oGs1.ToJSON(),
            stop: oGs2.ToJSON()
        };
builder.CloseFile();

//////////////////////

builder.CreateFile("docx");
    var json = GlobalVariable["json"];
    var oDocument = Api.GetDocument();
     for (var [key, value] of Object.entries(json)) {
         var oPar = Api.CreateParagraph();
         oPar.AddText(value);
         oDocument.Push(oPar)
     }
    var oPar1 = oDocument.GetElement(0);
    var oFill = Api.CreateRadialGradientFill([Api.FromJSON(json.start), Api.FromJSON(json.stop)]);
    var oStroke = Api.CreateStroke(0, Api.CreateNoFill());
    var oDrawing = Api.CreateShape("rect", 1908000, 1404000, oFill, oStroke);
        oPar1.AddDrawing(oDrawing);
        oPar1.AddLineBreak();
        oPar1.AddText(oDrawing.ToJSON(bWriteNumberings = false, bWriteStyles = false))
builder.SaveFile("docx", "GradientStopToJSON.docx");
builder.CloseFile();

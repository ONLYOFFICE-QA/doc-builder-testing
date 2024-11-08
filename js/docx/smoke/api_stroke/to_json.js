builder.CreateFile("docx");
    var oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0);
    var oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000);
    var arr = []
        arr.push(Api.CreateBlipFill("https://legacy-api.onlyoffice.com/content/img/docbuilder/examples/icon_DocumentEditors.png", "tile"));
        arr.push(Api.CreateSolidFill(Api.CreateRGBColor(102, 0, 204)))
        arr.push(Api.CreateLinearGradientFill([oGs1, oGs2], 5400000))
        arr.push(Api.CreateNoFill())
        arr.push(Api.CreatePatternFill("cross", Api.CreateRGBColor(255, 111, 61), Api.CreateRGBColor(51, 51, 51)))
        arr.push(Api.CreateRadialGradientFill([oGs1, oGs2]))
        arr = arr.map((fill) => {
            var oStroke = Api.CreateStroke(10 * 36000, fill);
            return oStroke.ToJSON()
        })
        GlobalVariable["arrStroke"] = arr;
builder.CloseFile();

//////////////////////

builder.CreateFile("docx");
    var arrStroke = GlobalVariable["arrStroke"];
    arrStroke.forEach((stroke) => {
        var odoc = Api.GetDocument();
        var opar = Api.CreateParagraph();
            opar.AddText(stroke)
            odoc.Push(opar)
    })
    arrStroke.forEach((stroke) => {
        var oStroke = Api.FromJSON(stroke);
        var odoc = Api.GetDocument();
        var opar = Api.CreateParagraph();
        var oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 0);
        var oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 100000);
        var oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
        var oDrawing = Api.CreateShape("star10", 10000 * 593, 10000 * 590, oFill, oStroke);
        opar.AddDrawing(oDrawing);
        odoc.Push(opar);
    });
builder.SaveFile("docx", "StrokeToJson.docx");
builder.CloseFile();

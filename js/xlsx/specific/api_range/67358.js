builder.CreateFile("xlsx");
    var oWorksheet = Api.GetActiveSheet()
        oWorksheet.GetRange('A1').SetValue('1')
        oWorksheet.GetRange('G8').SetValue('1')
    var oRange = Api.GetRange("F5:G8");
    var oSearchRange = oRange.Find("1",
                                    null,
                                    "xlValues",
                                    "xlWhole",
                                    "xlByColumns",
                                    "xlNext",
                                    false);
    oSearchRange.SetFillColor(Api.CreateColorFromRGB(255, 213, 191));
builder.SaveFile("xlsx", "Find.xlsx");
builder.CloseFile();

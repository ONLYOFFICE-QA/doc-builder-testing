builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oColor = Api.CreateColorFromRGB(49, 133, 154);
oWorksheet.GetRange("A2").SetValue("Text with color");
oWorksheet.GetRange("A2").SetFontColor(oColor);
builder.SaveFile("xlsx", "CreateColorFromRGB.xlsx");
builder.CloseFile();
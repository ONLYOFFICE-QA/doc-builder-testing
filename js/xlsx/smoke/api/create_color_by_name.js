builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oColor = Api.CreateColorByName("ltSteelBlue");
oWorksheet.GetRange("A2").SetValue("Text with color");
oWorksheet.GetRange("A2").SetFontColor(oColor);
builder.SaveFile("xlsx", "CreateColorByName.xlsx");
builder.CloseFile();
